//
//  WizardPageView.swift
//  Wizard
//
//  Created by Oleksii Mykhailenko on 1/4/19.
//  Copyright © 2019 Oleksii Mykhailenko. All rights reserved.
//

final class WizardPageView: UIView {
    
    private var wizardPage = WizardPage(title: "", subTitle: "", image: UIImage(), subImage: UIImage())
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    private var imageView = UIImageView()
    private var subImageView = UIImageView()
    
    // MARK: - Init
    
    public convenience init(page: WizardPage) {
        self.init(frame: CGRect.zero)
        self.backgroundColor = .white
        self.wizardPage = page
        self.setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupTitle()
        setupSubtitle()
        setupImageView()
        setupSubImageView()
    }
    
    private func setupTitle() {
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        titleLabel.text = wizardPage.title
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.textColor = .darkGray
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSubtitle() {
        subtitleLabel.text = wizardPage.subTitle
        subtitleLabel.font = .systemFont(ofSize: 18, weight: .regular)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textColor = .darkGray
        self.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupImageView() {
        imageView.image = wizardPage.image
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 25),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6, constant: 0),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 272/133)
        ])
    }
    
    private func setupSubImageView() {
        subImageView.image = wizardPage.subImage
        subImageView.contentMode = .scaleAspectFit
        addSubview(subImageView)
        subImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            subImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            subImageView.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.7),
            subImageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
            ])
    }
}
