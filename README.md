# Wizard 🎩✨

[![Version](https://img.shields.io/cocoapods/v/Wizard.svg?style=flat)](https://cocoapods.org/pods/Wizard)
[![License](https://img.shields.io/cocoapods/l/Wizard.svg?style=flat)](https://cocoapods.org/pods/Wizard)
[![Platform](https://img.shields.io/cocoapods/p/Wizard.svg?style=flat)](https://cocoapods.org/pods/Wizard)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS: 11.0+

Swift: 4.2

## Installation

Wizard is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Wizard'
```

## How to use

1. Create  ``WizardPage()``, add custom elemets on it or create page with phone cover ``WizardPhonePage``
2. Create Wizard Controller with array of pages ``WizardController(pages: [WizardPhonePage...])``
3. Present Wizard Controller ``present``


### WizardPhonePage:
```let page = WizardPhonePage(title: "Only iPhone",
subtitle: "No other phone\nis like iPhone.",
phoneContent: UIImage(), // You can add your content image 
phonePosition: .top, // Phone position relatively title and subtitle
phoneType: .iPhoneX) // Phone skin (.iPhoneX, .iPhone8white, .iPhone8black)
page.titleColor = .orange // Title color
page.titleFont = UIFont.systemFont(ofSize: 22, weight: .bold) // Title font
page.subtitleColor = .darkGray // Subtitle color
page.subtitleFont = UIFont.systemFont(ofSize: 18, weight: .light) // Subtitle font
```

### WizardPage:
```let customPage = WizardPage()
```
Use ``customPage`` like main UIView. You can add UILabel, UIImage etc...

### WizardController:
```let wizardController = WizardController(pages: [page, customPage])

// Add a delegate if you want to know when the user swiped to the next/prev page or taped the skip/next/done button.
wizardController.delegate = self

// Present Wizard controller.
present(wizardController, animated: false)
```

## Feature

### Global
- [x] ~~Create Wizard~~
- [ ] Add new features 🚀


### Wizard Controller
- [x] ~~Create static Wizard Controller~~
- [x] ~~Customized text of control buttons title~~ 
- [x] ~~Customized text colors of control buttons title~~
- [ ] Customized font of control buttons title
- [ ] Hide/show control buttons and page control
- [ ] Customized page control colors

### Wizard Phone Page
- [x] ~~Create static Wizard Phone Page~~
- [x] ~~Customized text~~
- [x] ~~Customized text fonts~~
- [x] ~~Customized text colors~~
- [x] ~~Phone position top/center/bottom relative to the title and subtitle~~

## Author

Oleksii Mykhailenko, moon4ik@gmail.com

## License

Wizard is available under the MIT license. See the LICENSE file for more info.
