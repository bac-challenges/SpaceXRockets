//
//  AppDelegate.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, WindowInjected, SplitViewControllerInjected, AppCoordinatorInjected {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator.start()
        window.makeKeyAndVisible()
        return true
    }
}
