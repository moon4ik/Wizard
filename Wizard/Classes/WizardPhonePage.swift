//
//  WizardPhonePage.swift
//  Wizard
//
//  Created by Oleksii Mykhailenko on 1/11/19.
//  Copyright © 2019 Oleksii Mykhailenko. All rights reserved.
//

//import IOSDevice

public enum WizardPhoneType {
    case iPhoneX
    case iPhone8white
    case iPhone8black
}

public final class WizardPhonePage: WizardPage {
    
    private var title: String = ""
    private var subtitle: String = ""
    private var phoneImage: UIImage = .init()
    private var contentImage: UIImage = .init()

    private var titleLabel: UILabel = .init()
    private var subtitleLabel: UILabel = .init()
    private var phoneImageView: UIImageView = .init()
    private var contentImageView: UIImageView = .init()
    
    private var heightMultiplier: CGFloat {
        return 0.65
    }
    private var contentHeightMultiplier: CGFloat {
        return phoneType == .iPhoneX ? 0.86 : 0.74
    }
    private var contentWidthMultiplier: CGFloat {
        return UIScreen.main.bounds.height > 800 ? 0.53 : 0.47
    }
    
    private var defaultConstraint: CGFloat {
        return UIScreen.main.bounds.height < 600 ? 0 : 15
    }
    private var topConstraint: CGFloat {
        return UIScreen.main.bounds.height < 600 ? 15 : 50
    }
    private var bottomConstraint: CGFloat {
        return UIScreen.main.bounds.height < 600 ? -50 : -55
    }
    private var leadingConstraint: CGFloat {
        return UIScreen.main.bounds.height < 600 ? 15 : 25
    }
    private var trailingConstraint: CGFloat {
        return UIScreen.main.bounds.height < 600 ? -15 : -25
    }
    private var phoneType: WizardPhoneType = .iPhoneX
    
    public var titleFont: UIFont = .systemFont(ofSize: 22, weight: .medium) {
        didSet {
            titleLabel.font = titleFont
        }
    }
    
    public var subtitleFont: UIFont = .systemFont(ofSize: 18, weight: .regular) {
        didSet {
            subtitleLabel.font = subtitleFont
        }
    }
    
    public var titleColor: UIColor = .darkGray {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    public var subtitleColor: UIColor = .darkGray {
        didSet {
            subtitleLabel.textColor = subtitleColor
        }
    }
    
    // MARK: - Init
    
    public required init(title: String,
                         subtitle: String,
                         phoneContent: UIImage,
                         phonePosition: WizardContentPosition = .bottom,
                         phoneType: WizardPhoneType = .iPhoneX) {
        super.init(phonePosition)
        self.title = title
        self.subtitle = subtitle
        self.contentImage = phoneContent
        self.phoneType = phoneType
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        setupPhoneImage()
        setupObjects()
        setupConstraints()
    }
    
    // MARK: - Setup Objects
    
    private func setupPhoneImage() {
        switch phoneType {
        case .iPhone8white:
            phoneImage = UIImage(named: "iPhone8white",
                                 in: Bundle(for: WizardPhonePage.self),
                                 compatibleWith: nil) ?? UIImage()
        case .iPhone8black:
            phoneImage = UIImage(named: "iPhone8black",
                                 in: Bundle(for: WizardPhonePage.self),
                                 compatibleWith: nil) ?? UIImage()
        default:
            phoneImage = UIImage(named: "iPhoneX",
                                 in: Bundle(for: WizardPhonePage.self),
                                 compatibleWith: nil) ?? UIImage()
        }
    }
    
    private func setupObjects() {
        setupTitle()
        setupSubtitle()
        setupPhoneView()
        setupContentView()
    }
    
    private func setupTitle() {
        titleLabel.font = titleFont
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.textColor = titleColor
//        titleLabel.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSubtitle() {
        subtitleLabel.text = subtitle
        subtitleLabel.font = subtitleFont
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textColor = subtitleColor
//        subtitleLabel.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupPhoneView() {
        phoneImageView.image = phoneImage
        phoneImageView.contentMode = .scaleAspectFit
//        phoneImageView.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        addSubview(phoneImageView)
        phoneImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupContentView() {
        contentImageView.image = contentImage
//        contentImageView.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        contentImageView.clipsToBounds = true
        contentImageView.contentMode = .scaleAspectFit
        addSubview(contentImageView)
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        setupTitleConstraints()
        setupSubtitleConstraints()
        setupPhoneViewConstraints()
        setupContentViewConstraints()
    }
    
    private func setupTitleConstraints() {
        switch contentPosition {
        case .top:
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: phoneImageView.bottomAnchor,
                                                constant: defaultConstraint)
                ])
        case .center:
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                constant: topConstraint)
                ])
        case .bottom:
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                                constant: topConstraint)
                ])
        }
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                constant: leadingConstraint),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                 constant: trailingConstraint)
            ])
    }
    
    private func setupSubtitleConstraints() {
        switch contentPosition {
        case .top:
            NSLayoutConstraint.activate([
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                   constant: subtitle.isEmpty ? 0 : defaultConstraint),
                subtitleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                      constant: bottomConstraint)
                ])
        case .center:
            NSLayoutConstraint.activate([
                subtitleLabel.topAnchor.constraint(equalTo: phoneImageView.bottomAnchor,
                                                   constant: subtitle.isEmpty ? 0 : defaultConstraint),
                subtitleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                      constant: bottomConstraint)
                ])
        case .bottom:
            NSLayoutConstraint.activate([
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                   constant: subtitle.isEmpty ? 0 : defaultConstraint)
                ])
        }
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                   constant: leadingConstraint),
            subtitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                    constant: trailingConstraint)
            ])
        if subtitle.isEmpty {
            subtitleLabel.heightAnchor.constraint(equalToConstant: 0).isActive = true
        } else {
            subtitleLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor).isActive = true
        }
    }
    
    private func setupPhoneViewConstraints() {
        switch contentPosition {
        case .top:
            NSLayoutConstraint.activate([
                phoneImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                   constant: topConstraint)
                ])
        case .center:
            NSLayoutConstraint.activate([
                phoneImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                   constant: defaultConstraint)
                ])
        case .bottom:
            NSLayoutConstraint.activate([
                phoneImageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,
                                                   constant: defaultConstraint),
                phoneImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                    constant: bottomConstraint)
                ])
        }
        NSLayoutConstraint.activate([
            phoneImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            phoneImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            phoneImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor,
                                                   multiplier: heightMultiplier)
            ])
    }
    
    private func setupContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentImageView.centerXAnchor.constraint(equalTo: phoneImageView.centerXAnchor),
            contentImageView.centerYAnchor.constraint(equalTo: phoneImageView.centerYAnchor),
            contentImageView.widthAnchor.constraint(equalTo: phoneImageView.widthAnchor,
                                                    multiplier: contentWidthMultiplier),
            contentImageView.heightAnchor.constraint(equalTo: phoneImageView.heightAnchor,
                                                     multiplier: contentHeightMultiplier)
            ])
    }
}
