//
//  DIContainer.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import UIKit

// MARK: - Coordinator
struct InjectionMap {
    static var appCoordinator = AppCoordinator()
    static var listCoordinator = ListCoordinator()
    static var detailCoordinator = DetailCoordinator()
}

// MARK: AppCoordinator
protocol AppCoordinatorInjected {}

extension AppCoordinatorInjected {
    var appCoordinator: AppCoordinator { get { return InjectionMap.appCoordinator } }
}

// MARK: ListCoordinator
protocol ListCoordinatorInjected {}

extension ListCoordinatorInjected {
    var listCoordinator: ListCoordinator { get { return InjectionMap.listCoordinator } }
}

// MARK: DetailCoordinator
protocol DetailCoordinatorInjected {}

extension DetailCoordinatorInjected {
    var detailCoordinator: DetailCoordinator { get { return InjectionMap.detailCoordinator } }
}


// MARK: - View Model
extension InjectionMap {
    static var listViewModel = ListViewModel()
    static var detailViewModel = DetailViewModel()
}

// MARK: ListViewModel
protocol ListViewModelInjected {}

extension ListViewModelInjected {
    var listViewModel: ListViewModel { get { return InjectionMap.listViewModel } }
}

// MARK: DetailViewModel
protocol DetailViewModelInjected {}

extension DetailViewModelInjected {
    var detailsViewModel: DetailViewModel { get { return InjectionMap.detailViewModel } }
}


// MARK: - Model
extension InjectionMap {
    static var listModel: ListModelType = ListModel()
}

// MARK: ListModel
protocol ListModelInjected {}

extension ListModelInjected {
    var listModel: ListModelType { get { return InjectionMap.listModel } }
}


// MARK: - Util
extension InjectionMap {
    
    static var window = UIWindow()
    
    static var splitViewController: UISplitViewController = {
        let controller = UISplitViewController(style: .doubleColumn)
        controller.preferredDisplayMode = .oneBesideSecondary
        return controller
    }()
    
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }
}

// MARK: UIWindow
protocol WindowInjected {}

extension WindowInjected {
    var window: UIWindow { get { return InjectionMap.window } }
}

// MARK: UISplitViewController
protocol SplitViewControllerInjected {}

extension SplitViewControllerInjected {
    var splitViewController: UISplitViewController { get { return InjectionMap.splitViewController } }
}

// MARK: UIStoryboard
protocol StoryboardInjected {}

extension StoryboardInjected {
    var storyboard: UIStoryboard { get { return InjectionMap.storyboard } }
}

// MARK: JSONDecoder
protocol JSONDecoderInjected {}

extension JSONDecoderInjected {
    var jsonDecoder: JSONDecoder { get { return InjectionMap.jsonDecoder } }
}
