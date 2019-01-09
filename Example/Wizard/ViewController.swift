//
//  ViewController.swift
//  Wizard
//
//  Created by Oleksii Mykhailenko on 01/08/2019.
//  Copyright (c) 2019 Oleksii Mykhailenko. All rights reserved.
//

import UIKit
import Wizard

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Pages
        let firstPage = WizardPage(title: "First Title",
                                   subTitle: "Description with two lines",
                                   image: UIImage(),
                                   subImage: UIImage())
        let secondPage = WizardPage(title: "Secind Title",
                                    subTitle: "Description with two lines. \n Second line :)",
                                   image: UIImage(),
                                   subImage: UIImage())
        let thirdPage = WizardPage(title: "Third Title",
                                    subTitle: "Description with two lines. \n Second line :)",
                                    image: UIImage(),
                                    subImage: UIImage())
        let allPages = [firstPage, secondPage, thirdPage]
        
        // Wizard ViewController
        let wizardViewController = WizardController(pages: allPages)
        
        // Add a delegate if you want to know when the user swiped to the next/prev page or taped the skip/next/done button.
        wizardViewController.delegate = self
        
        // Present or push view controller.
        present(wizardViewController, animated: false)
    }

}

// WizardDelegate methods

extension ViewController: WizardDelegate {
    
    func nextDidSwipe() {
        // Do something when user swipe to Next
        print("swipe next")
    }
    
    func prevDidSwipe() {
        // Do something when user swipe to Prev
        print("swipe prev")
    }
    
    func skipDidTap() {
        // Do something when user tap Skip
        print("Skip")
        showAlert()
    }
    
    func nextDidTap() {
        // Do something when user tap/swipe Next
        print("Next")
    }
    
    func doneDidTap() {
        // Do something when user tap Done (at last page)
        print("Done")
        showAlert()
    }
}

// UIAlertController

extension ViewController {
    func showAlert() {
        let alert = UIAlertController(title: "Alert",
                                      message: "Wizard ViewController did dismiss and show again :)",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        alert.show()
    }
}

public extension UIAlertController {
    
    /// Show UIAlertController on separate UIWindow
    
    public func show() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        window.rootViewController = viewController
        window.windowLevel = UIWindow.Level.alert + 1
        window.makeKeyAndVisible()
        viewController.present(self, animated: true, completion: nil)
    }
}
