//
//  AppDelegate.swift
//  Geoloc
//
//  Created by Gougerot Elisa on 27/11/2019.
//  Copyright © 2019 Elisa Gougerot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds);
        window.rootViewController = UINavigationController(rootViewController: HomeViewController());
        window.makeKeyAndVisible();
        self.window = window;
        return true
    }

}

