//
//  WizardPage.swift
//  Wizard
//
//  Created by Oleksii Mykhailenko on 1/4/19.
//  Copyright © 2019 Oleksii Mykhailenko. All rights reserved.
//

public enum WizardContentPosition {
    case top
    case center
    case bottom
}

public class WizardPage: UIView {
    
    var contentPosition: WizardContentPosition = .bottom
    
    // MARK: - Init
    
    public init(_ contentPosition: WizardContentPosition = .bottom) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.contentPosition = contentPosition
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
