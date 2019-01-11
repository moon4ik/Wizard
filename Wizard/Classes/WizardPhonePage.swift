//
//  WizardPhonePage.swift
//  Wizard
//
//  Created by Oleksii Mykhailenko on 1/11/19.
//  Copyright © 2019 Oleksii Mykhailenko. All rights reserved.
//

public final class WizardPhonePage: WizardPage {
    
    public required init(title: String, subtitle: String, phoneContent: UIImage) {
        let phoneImage: UIImage = UIImage(named: "iPhone8",
                                          in: Bundle(for: WizardPhonePage.self),
                                          compatibleWith: nil) ?? UIImage()
        super.init(title: title,
                  subtitle: subtitle,
                  image: phoneImage,
                  subimage: phoneContent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
