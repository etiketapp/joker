//
//  AppDelegate.swift
//  Rapunzel
//
//  Created by tunay alver on 1.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let shared = UIApplication.shared.delegate as! AppDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let afterLaunch = AfterLaunchRouter.createAfterLaunchModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = afterLaunch
        window?.makeKeyAndVisible()
        
        return true
    }
    
    //MARK: - View Controller To Window
    func goToScreen(view: UIViewController) {
        UIView.transition(with: window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
            UIView.performWithoutAnimation({
                self.window?.rootViewController = view
            })
        }, completion: nil)
    }

}

