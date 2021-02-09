//
//  AppCoordinator.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import UIKit

final class AppCoordinator: Coordinator, WindowInjected, SplitViewControllerInjected, ListCoordinatorInjected {
    
    func start() {
        window.rootViewController = splitViewController
        showLaunch()
    }
    
    func showLaunch()
    {
        listCoordinator.start()
    }
    
    func open(_ url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}
