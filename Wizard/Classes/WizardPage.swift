//
//  WizardPage.swift
//  Wizard
//
//  Created by Oleksii Mykhailenko on 1/4/19.
//  Copyright © 2019 Oleksii Mykhailenko. All rights reserved.
//

public enum WizardTextPosition {
    case top
    case bottom
    case center
}

public class WizardPage: UIView {
    
    private var title: String = ""
    private var subtitle: String = ""
    private var image: UIImage = .init()
    private var subimage: UIImage = .init()
    private var titleLabel: UILabel = .init()
    private var subtitleLabel: UILabel = .init()
    private var imageView: UIImageView = .init()
    private var subimageView: UIImageView = .init()
    
    private var customeView: UIView = .init()
    private var customeViewInsets: UIEdgeInsets = .zero
    
//    public var textPosition: WizardTextPosition = .top
    
    public var titleFont: UIFont = .systemFont(ofSize: 22, weight: .medium)
    public var subtitleFont: UIFont = .systemFont(ofSize: 18, weight: .regular)
    public var titleColor: UIColor = .darkGray
    public var subtitleColor: UIColor = .darkGray
    
    
    // MARK: - Init
    
    public init(title: String, subtitle: String, image: UIImage, subimage: UIImage = UIImage()) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.subimage = subimage
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setup()
    }
    
    public init(view: UIView, insets: UIEdgeInsets = .zero) {
        self.customeView = view
        self.customeViewInsets = insets
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupCustomView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupCustomView() {
        addSubview(customeView)
        customeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customeView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                             constant: customeViewInsets.top),
            customeView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: customeViewInsets.left),
            customeView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: -customeViewInsets.right),
            customeView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                                                constant: -customeViewInsets.bottom)
            ])
    }
    
    private func setup() {
        setupTitle()
        setupSubtitle()
        setupImageView()
        setupSubImageView()
    }
    
    private func setupTitle() {
        titleLabel.font = titleFont
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.textColor = titleColor
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: -25),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setupSubtitle() {
        subtitleLabel.text = subtitle
        subtitleLabel.font = subtitleFont
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textColor = subtitleColor
        addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                               constant: 0),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                   constant: 25),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                    constant: -25),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 60)
            ])
    }
    
    private func setupImageView() {
        imageView.image = image
        imageView.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let multiplier = UIScreen.main.bounds.width / UIScreen.main.bounds.height
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,
                                           constant: 5*UIScreen.main.scale),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor,
                                             multiplier: multiplier < 0.5 ? 0.7 : multiplier*1.2, constant: 0),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor,
                                              constant: 0),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor,
                                              multiplier: 1 / multiplier)//272/133)
            ])
    }
    
    private func setupSubImageView() {
        subimageView.image = subimage
        subimageView.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        subimageView.clipsToBounds = true
        subimageView.contentMode = .scaleAspectFit
        addSubview(subimageView)
        subimageView.translatesAutoresizingMaskIntoConstraints = false
        let multiplier = UIScreen.main.bounds.width / UIScreen.main.bounds.height
        NSLayoutConstraint.activate([
            subimageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            subimageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            subimageView.widthAnchor.constraint(equalTo: imageView.widthAnchor,
                                                multiplier: 0.80),
            subimageView.heightAnchor.constraint(equalTo: subimageView.widthAnchor,
                                                 multiplier: 1/multiplier - 0.3)
            ])
    }
}
