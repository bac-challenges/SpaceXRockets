//
//  ListCoordinator.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import UIKit
import Alamofire

final class ListCoordinator: Coordinator, SplitViewControllerInjected, StoryboardInjected, DetailCoordinatorInjected {
    
    private var controller: ListController?
    
    func start() {
        
        controller = storyboard.instantiateViewController(withIdentifier: "ListController") as? ListController
        
        guard let listController = controller else { return }
        
        splitViewController.setViewController(UINavigationController(rootViewController: listController), for: .primary)
    }
    
    func showDetail(_ item: RocketViewItem) {
        detailCoordinator.item = item
        detailCoordinator.start()
    }
}
