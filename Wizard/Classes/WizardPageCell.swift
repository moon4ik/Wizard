//
//  WizardPageCell.swift
//  Wizard
//
//  Created by Oleksii Mykhailenko on 1/8/19.
//  Copyright © 2019 Oleksii Mykhailenko. All rights reserved.
//

import Foundation

class WizardPageCell: UICollectionViewCell {
    
    public var page: UIView? {
        didSet {
            guard let pageView = page else {
                if contentView.subviews.count > 0 {
                    contentView.subviews.forEach{ $0.removeFromSuperview() }
                }
                return
            }
            contentView.addSubview(pageView)
            pageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
                pageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
                pageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
                pageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
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
