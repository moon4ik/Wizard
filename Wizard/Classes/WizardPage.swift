//
//  WizardPage.swift
//  Wizard
//
//  Created by Oleksii Mykhailenko on 1/8/19.
//  Copyright © 2019 Oleksii Mykhailenko. All rights reserved.
//

import Foundation

public struct WizardPage {
    let title: String
    let subTitle: String
    let image: UIImage
    let subImage: UIImage
    
    public init(title: String, subTitle: String, image: UIImage, subImage: UIImage) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
        self.subImage = subImage
    }
}
