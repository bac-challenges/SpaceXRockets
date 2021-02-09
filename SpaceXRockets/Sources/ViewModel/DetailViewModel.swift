//
//  DetailViewModel.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import Foundation

final class DetailViewModel: AppCoordinatorInjected {
    func open(_ url: String) {
        appCoordinator.open(url)
    }
}
