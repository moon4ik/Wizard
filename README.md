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

1. Create pages ``WizardPage(title: String, subTitle: String, image: UIImage, subImage: UIImage)``
2. Create Wizard Controller with array of pages ``WizardController(pages: [WizardPage])``
3. Present Wizard Controller


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

### Wizard Page
- [x] ~~Create static Wizard Page~~
- [x] ~~Customized text~~
- [ ] Customized text fonts
- [ ] Customized text colors
- [ ] Text position top/bottom relative to the image.

## Author

Oleksii Mykhailenko, moon4ik@gmail.com

## License

Wizard is available under the MIT license. See the LICENSE file for more info.
