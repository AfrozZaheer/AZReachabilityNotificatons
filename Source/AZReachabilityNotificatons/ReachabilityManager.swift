//
//  ReachabilityManager.swift
//  AZReachability
//
//  Created by Muhammad Afroz on 8/2/17.
//  Copyright © 2017 AfrozZaheer. All rights reserved.
//

import UIKit
import Alamofire
import CWStatusBarNotification
import Whisper

public class ReachabilityManager: NSObject {
    
    //MARK: - Public Variables

    public static let manager = ReachabilityManager()
    
    // Default text and colors
    
    public var internetAvailableBackgroundColor: UIColor    = UIColor(red: 69/255, green: 205/255, blue: 96/255, alpha: 1.0)
    public var internetNotAvailableBackgroundColor: UIColor = UIColor(red: 255/255, green: 57/255, blue: 57/255, alpha: 1.0)
    public var internetAvailableText: String                = "Connected"
    public var internetNotAvailableText: String             = "No Internet Connection"

    //MARK: - Private Variables
    var isShowingNotification                   = false
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    let statusBarNotification = CWStatusBarNotification()
    var navigationController: UINavigationController?
    
    
    //MARK: - Start Reacability
    
    public func startNetworkReachabilityObserver(notificationType: NotificationType) {
        
        statusBarNotification.notificationAnimationInStyle = .top
        statusBarNotification.notificationAnimationOutStyle = .top
        
        reachabilityManager?.listener = { status in
            
            switch status {
                
            case .notReachable:
                
                switch notificationType {
                case .OnStatusBar:
    
                    self.statusBarNotification.notificationLabelBackgroundColor = self.internetNotAvailableBackgroundColor
                    self.statusBarNotification.display(withMessage: self.internetNotAvailableText, completion: nil)
                    self.isShowingNotification = true
                    
                case .UnderNavigation:
                    if let controller = self.getTopController() {
                        self.navigationController = controller
                        let message = Message.init(title: self.internetNotAvailableText, textColor: UIColor.white, backgroundColor: self.internetNotAvailableBackgroundColor, images: nil)
                        Whisper.show(whisper: message, to: controller, action: .present)
                    }
                    else {
                        self.statusBarNotification.notificationLabelBackgroundColor = self.internetNotAvailableBackgroundColor
                        self.statusBarNotification.display(withMessage: self.internetNotAvailableText, completion: nil)
                        self.isShowingNotification = true
                    }
                }
                
            case .unknown :
                print("It is unknown whether the network is reachable")
                
            case .reachable(.ethernetOrWiFi):
                self.dismissAlert()
                
            case .reachable(.wwan):
                self.dismissAlert()
            }
        }
        
        reachabilityManager?.startListening()
    }
    
    public func stopNetworkReachability() {
        reachabilityManager?.stopListening()
    }
    
    
    //MARK: - Private functions
    fileprivate func dismissAlert() {
        
        if self.navigationController != nil {
            
            let message = Message.init(title: self.internetAvailableText, textColor: UIColor.white, backgroundColor: self.internetAvailableBackgroundColor, images: nil)

            Whisper.show(whisper: message, to: self.navigationController!, action: .show)
            
        }
        hideStatusBarNotification()
            
    }
    
    fileprivate func hideStatusBarNotification() {
        if isShowingNotification {
            statusBarNotification.notificationLabel.backgroundColor = internetAvailableBackgroundColor
            statusBarNotification.notificationLabel.text = internetAvailableText
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.30, execute: { [weak self] in
            
            guard let strongSelf = self else { return }
            strongSelf.statusBarNotification.dismiss()
        })
    }

    fileprivate func getTopController() -> UINavigationController? {
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            var responder = topController.next
            
            while responder != nil {
                if responder is UINavigationController {
                    break
                }
                responder = responder?.next
            }
            
            return topController as? UINavigationController
        }
        return nil
    }
}
public enum NotificationType : Int {
    case UnderNavigation = 0,
    OnStatusBar
}

