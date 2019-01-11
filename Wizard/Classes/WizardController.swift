//
//  WizardController.swift
//  Wizard
//
//  Created by Oleksii Mykhailenko on 1/8/19.
//  Copyright © 2019 Oleksii Mykhailenko. All rights reserved.
//

import Foundation

public protocol WizardDelegate: class {
    func skipDidTap()
    func nextDidTap()
    func nextDidSwipe()
    func prevDidSwipe()
    func doneDidTap()
}

public class WizardController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var pages = [WizardPage]()
    private var skipButton = UIButton()
    private var nextButton = UIButton()
    private var pageControl = UIPageControl()
    private var bottomControllStackView = UIStackView()
    private var isSkipButtonHidden: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let `self` = self else { return }
                self.skipButton.alpha = self.isSkipButtonHidden ? 0 : 1
                self.skipButton.isEnabled = !self.isSkipButtonHidden
            }
        }
    }
    
    // MARK: - PUBLIC
    
    public weak var delegate: WizardDelegate?

    public var skipButtonTitle: String = "SKIP" {
        didSet {
            skipButton.setTitle(skipButtonTitle.uppercased(), for: .normal)
        }
    }
//    private var emptySkipButtonTitle: String = ""
    
    public var skipButtonColor: UIColor = .darkGray {
        didSet {
            skipButton.setTitleColor(skipButtonColor, for: .normal)
        }
    }
    
    public var nextButtonTitle: String = "NEXT" {
        didSet {
            nextButton.setTitle(nextButtonTitle.uppercased(), for: .normal)
        }
    }
    
    public var nextButtonColor: UIColor = .orange {
        didSet {
            nextButton.setTitleColor(nextButtonColor, for: .normal)
        }
    }
    
    public var nextButtonEnabled: Bool = true {
        didSet {
            nextButton.isEnabled = nextButtonEnabled
        }
    }
    
    public var doneButtonTitle: String = "DONE" {
        didSet {
            nextButton.setTitle(doneButtonTitle.uppercased(), for: .normal)
        }
    }
    
    // MARK: - Init
    
    public required init(pages: [WizardPage]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        self.pages = pages
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupBottomControllStackView()
    }
    
    private func dismissAnimated() {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: .default)
        transition.type = .fade
        transition.subtype = .fromBottom
        view.window!.layer.add(transition, forKey: nil)
        dismiss(animated: false, completion: nil)
    }
    
    // MARK: - ScrollView
    
    public override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let currentItem = Int(x / self.view.frame.width)
        
        if currentItem > pageControl.currentPage {
            delegate?.nextDidSwipe()
        } else if currentItem < pageControl.currentPage {
            delegate?.prevDidSwipe()
        }
        
        switch currentItem {
        case pages.count-1:
            nextButton.setTitle(doneButtonTitle.uppercased(), for: .normal)
            isSkipButtonHidden = true
        default:
            nextButton.setTitle(nextButtonTitle.uppercased(), for: .normal)
            isSkipButtonHidden = false
        }
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let `self` = self else { return }
            self.pageControl.currentPage = currentItem
        }
    }
    
    // MARK: - CollectionView
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(WizardPageCell.self, forCellWithReuseIdentifier: "WizardPageCell")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WizardPageCell", for: indexPath) as! WizardPageCell
        cell.page = pages.count > indexPath.item ? pages[indexPath.item] : nil
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: - StackView
    
    private func setupBottomControllStackView() {
        setupSkipButton()
        setupNextButton()
        setupPageControl()
        bottomControllStackView = UIStackView(arrangedSubviews: [skipButton, pageControl, nextButton])
        bottomControllStackView.alignment = .center
        bottomControllStackView.distribution = .fillEqually
        bottomControllStackView.spacing = 25
        view.addSubview(bottomControllStackView)
        bottomControllStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomControllStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            bottomControllStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            bottomControllStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bottomControllStackView.heightAnchor.constraint(equalToConstant: 50),
            ])
    }
    
    private func setupSkipButton() {
        skipButton.setTitle(skipButtonTitle.uppercased(), for: .normal)
        skipButton.setTitleColor(skipButtonColor, for: .normal)
        skipButton.addTarget(self, action: #selector(skipDidTap), for: .touchUpInside)
        isSkipButtonHidden = pages.count == 1
    }
    
    private func setupNextButton() {
        nextButton.setTitle(pages.count == 1 ? doneButtonTitle.uppercased() : nextButtonTitle.uppercased(), for: .normal)
        nextButton.setTitleColor(nextButtonColor, for: .normal)
        nextButton.addTarget(self, action: #selector(nextDidTap), for: .touchUpInside)
    }
    
    private func setupPageControl() {
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.currentPageIndicatorTintColor = .orange
    }
    
    // MARK: - Actions
    
    @objc private func skipDidTap() {
        delegate?.skipDidTap()
        dismissAnimated()
    }
    
    @objc private func nextDidTap() {
        let nextItem = pageControl.currentPage + 1
        switch nextItem {
        case pages.count:
            delegate?.doneDidTap()
            dismissAnimated()
            return
        case pages.count-1:
            nextButton.setTitle(doneButtonTitle.uppercased(), for: .normal)
            isSkipButtonHidden = true
            fallthrough
        default:
            let indexPath = IndexPath(item: nextItem, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.pageControl.currentPage = nextItem
            }
            skipButton.setTitle(skipButtonTitle.uppercased(), for: .normal)
            delegate?.nextDidTap()
        }
    }
}

