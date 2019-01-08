//
//  WizardPageCell.swift
//  Wizard
//
//  Created by Oleksii Mykhailenko on 1/8/19.
//  Copyright © 2019 Oleksii Mykhailenko. All rights reserved.
//

import Foundation

class WizardPageCell: UICollectionViewCell {
    
    public var page: WizardPage? {
        didSet {
            guard let `page` = page else { return }
            let wizardView = WizardPageView(page: page)
            if contentView.subviews.count > 0 {
                contentView.subviews.forEach{ $0.removeFromSuperview() }
            }
            contentView.addSubview(wizardView)
            wizardView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                wizardView.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor),
                wizardView.heightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.heightAnchor),
                wizardView.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                wizardView.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor)
                ])
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        page = nil
    }
    
}
