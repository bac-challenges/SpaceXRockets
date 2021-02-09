//
//  DetailCoordinator.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import UIKit
import SwiftUI

final class DetailCoordinator: Coordinator, SplitViewControllerInjected, StoryboardInjected {
    
    var item: RocketViewItem?
    
    func start() {
        
        guard let item = item else { return }
        
        let detailView = DetailView(item: item)
        let controller = UIHostingController(rootView: detailView)
        controller.title = "Rocket"

        splitViewController.setViewController(UINavigationController(rootViewController: controller), for: .secondary)
        splitViewController.show(.secondary)
    }
}
