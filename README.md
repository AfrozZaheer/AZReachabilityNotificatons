# AZReachability Notifications


![Alt text](http://i.imgur.com/dV5C8JE.png"AZ-Reachability")

[![Swift version](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat.svg)](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat.svg)
[![Support Dependecy Manager](https://img.shields.io/badge/support-CocoaPods-red.svg?style=flat.svg)](https://img.shields.io/badge/support-CocoaPods-red.svg?style=flat.svg)
[![Version](https://img.shields.io/cocoapods/v/AZTableView.svg?style=flat)](https://cocoapods.org/pods/AZReachabilityNotificatons)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://cocoapods.org/pods/AZReachabilityNotificatons)


<p align="center">
<a href="http://i.imgur.com/LnOE0b9.gif">
<img src="http://i.imgur.com/LnOE0b9.gif" height="450">
</a>
</p>

<p align="center">
<a href="http://i.imgur.com/lGBLiMm.gif">
<img src="http://i.imgur.com/lGBLiMm.gif" height="450">
</a>
</p>

## Features
* Simple, one method integration 
* Reachability notification on status bar and under navigation bar 

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```


To integrate AZReachability Notifications into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AZReachabilityNotificatons'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

#### Step 1

Import AZReachabilityNotificatons module in AppDelegate.swift and just call startNetworkReachabilityObserver

```swift

import UIKit
import AZReachabilityNotificatons

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let reachAbilityManager = ReachabilityManager.manager
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        reachAbilityManager.startNetworkReachabilityObserver(notificationType: .OnStatusBar) //enum to detrmin notification type
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        reachAbilityManager.stopNetworkReachability()
    }
}
```

#### Customization

* To show notification on status bar 

```swift
    reachAbilityManager.startNetworkReachabilityObserver(notificationType: .OnStatusBar) 

```
And for under Navigation bar
```swift
    reachAbilityManager.startNetworkReachabilityObserver(notificationType: .UnderNavigation)
```

* To have custom Strings in notification and change notification background color use this
```swift

    reachAbilityManager.internetAvailableBackgroundColor = UIColor.green // internet connectd 
    reachAbilityManager.internetNotAvailableBackgroundColor = UIColor.red // internet is not connected 


    reachAbilityManager.internetAvailableText = "Internet Connected" // internet is not connected
    reachAbilityManager.internetNotAvailableText = "No Internet Connection" // internet is not connected

```


#### Done
Thats it, you successfully integrate AZReachabilityNotificatons 

#### Dependencies
* Alamofire 
* CWStatusBarNotification
* Whisper

## License

AZReachabilityNotificatons is available under the MIT license. See the LICENSE file for more info.

## Author

**Afroz Zaheer** - (https://github.com/AfrozZaheer)

