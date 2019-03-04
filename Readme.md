# DownPickerSwift

[![Platforms](https://img.shields.io/cocoapods/p/DownPickerSwift.svg)](https://cocoapods.org/pods/DownPickerSwift) [![License](https://img.shields.io/cocoapods/l/DownPickerSwift.svg)](https://raw.githubusercontent.com/HomebaseAI/DownPickerSwift/master/LICENSE)

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DownPickerSwift.svg)](https://cocoapods.org/pods/DownPickerSwift)

<!--[![Travis](https://img.shields.io/travis/HomebaseAI/DownPickerSwift/master.svg)](https://travis-ci.org/HomebaseAI/DownPickerSwift/branches)-->

DownPickerSwift is an extremely light-weight class library for creating DropDownList / ComboBox controls for iOS that will behave like their HTML / Android counterparts. You'll only need a standard UITextField and few lines of code.

This library is inspired by [DownPicker](https://github.com/Darkseal/DownPicker)

-   [Features](<#What\ does\ it\ do>)
-   [How it Works](<#How\ does\ it\ work>)
-   [Requirements](#requirements)
-   [Installation](#installation)
-   [Usage](#usage)
-   [License](#license)

## What does it do

It takes any **UITextField** already present in your code (including those added to a _Storyboard_):

![alt text](https://raw.githubusercontent.com/Darkseal/DownPicker/gh-pages/images/DownPicker/UITextField.base.png "Here's a standard UITextField")

and turns it into this:

![alt text](https://raw.githubusercontent.com/Darkseal/DownPicker/gh-pages/images/DownPicker/UITextField.DownPicker.png "Here's a DownPicker control")

It's as simple as that. You only need to provide an array of data.

**NOTE**: If you don't like the _control wrapper_ approach, you can also use it as a _custom control_ via the included **UIDownPicker** class: read the following paragraph for more info.

## How does it work

DownPicker is basically a _control interface wrapper_, meaning that you won't use it as a control - it will use an existing UITextField control instead. This is a good thing, because you'll be able to design, positioning and skin your UITextField like you always do, programmatically or inside a _Storyboard_ UI, depending on how you are used to work. You won't change your style, as it will adapt to suit yours.

However, if you don't like the _control wrapper_ pattern, you can just use it as a _custom control_ using the included **UIDownPicker** class. It's entirely up to you (and very easy to install in both scenarios).

## Requirements

-   iOS 9.0+
-   Xcode 10.0+

# Installation

### Dependency Managers

<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate DownPickerSwift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'DownPickerSwift', '~> 1.1.0'
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
  <summary><strong>Carthage</strong></summary>

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate DownPickerSwift into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "HomebaseAI/DownPickerSwift" ~> 1.0.1
```

</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate DownPickerSwift into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

-   Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

-   Add DownPickerSwift as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/HomebaseAI/DownPickerSwift.git
$ git submodule update --init --recursive
```

-   Open the new `DownPickerSwift` folder, and drag the `DownPicker.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

-   Select the `DownPicker.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
-   Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
-   In the tab bar at the top of that window, open the "General" panel.
-   Click on the `+` button under the "Embedded Binaries" section.
-   You will see two different `DownPicker.xcodeproj` folders each with two different versions of the `DownPicker.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

-   Select the `DownPicker.framework`.

-   And that's it!

> The `DownPicker.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
  <summary><strong>Embedded Binaries</strong></summary><p>

-   Download the latest release from https://github.com/HomebaseAI/DownPickerSwift/releases
-   Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
-   In the tab bar at the top of that window, open the "General" panel.
-   Click on the `+` button under the "Embedded Binaries" section.
-   Add the downloaded `DownPicker.framework`.
-   And that's it!

</p></details>

# Usage

Once you have DownPicker installed and included in your project, you can either use it as a Control Wrapper or as a Custom Control: the choice is up to you, depending on your programming style.

### As a Control Wrapper

Add (or choose) a **UITextField** you would like to transform to a DownPicker. You can use the Storyboard designer tool or do it programmatically; you can also set up constraints, custom placement/coords, font, colors and anything else you like. When you're done, open your controller and create a property for the DownPicker wrapper:

    import DownPicker

    let textField = UITextField()
    let picker: DownPicker?

Then add these lines to your controller's **viewDidLoad** method:

    let dummyData = ["R.E.M.", "Dire Straits", "Police", "Sex Pistols", "Pink Floyd"]
    picker = DownPicker(with: textField, data: dummyData)

That's it. You can retrieve the user's choice at any time using `self.datePicker.text` or `textField.text`.

### As a Custom Control

If you'd like to use DownPicker as a custom control instead, just instantiate the included **UIDownPicker** class programmatically and attach it to your view like any other UI control:

    import DownPicker

    let picker: UIDownPicker?

Then add these lines to your controller's **viewDidLoad** method:

    let dummyData = ["R.E.M.", "Dire Straits", "Police", "Sex Pistols", "Pink Floyd"]
    picker = UIDownPicker(with: dummyData)

## Status Change event handling

You can bind your own delegate function to DownPicker's status change by using the `UIControlEventValueChanged` Control action in the following way:

    picker?.addTarget(self, action: #selector(printTest(selectedValue:)), for: .valueChanged)

    @objc private func printTest(selectedValue: DownPicker) {
        print(selectedValue.text)
    }

## Additional Features

You can also:

-   defer data loading using the `downPicker.setData(newData: [String])` method.
-   disable the right arrow image using the `downPicker.showArrowImage = false` method.
-   use a custom right arrow image using the `downPicker.setArrowImage(newImage: UIImage)`.
-   configure (and/or localize) the placeholder text string using the `downPicker.setPlaceholder(newString: String)` and `downPicker.setPlaceholderWhileSelecting(newString: String)` methods.
-   retrieve, customize and hook on the inner **UIPickerView** control using the `downPicker.getPickerView()` method (use at your own risk).
-   retrieve, customize and hook on the inner **UITextField** control using the `downPicker.getTextView()` method (use at your own risk). Remember that if you used the wrapper, it's the exact same control you passed so you might prefer to use your main reference instead.
-   the cancel button can be removed if the boolean flag property `shouldDisplayCancelButton` is set to `false` after DownPicker is instantiated.
-   add a title to the toolbar using `setToolbarTitle(newTitle: String)` for providing more context around what the picker is for.

# Contributing

Issues and pull requests are welcome!

## Author

This library is inspired by [DownPicker](https://github.com/Darkseal/DownPicker)  
Owned by [@HomebaseAI](https://twitter.com/HomebaseAI) and Maintained by [chickdan](https://github.com/chickdan)

## License

DownPickerSwift is released under the MIT license. See [LICENSE](https://github.com/HomebaseAI/DownPickerSwift/blob/master/LICENSE) for details.
