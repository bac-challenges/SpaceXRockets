//
//  ListViewModel.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import Foundation
import Combine

final class ListViewModel: ListCoordinatorInjected, ListModelInjected {

    @Published var items = [RocketViewItem]()
    @Published var refreshItems = [IndexPath]()
    @Published var isLoading = false

    private var disposables: Set<AnyCancellable> = []
    private let pendingOperations = PendingOperation()
    
    func get() {
        self.isLoading = true
        listModel.get(EndPoint.rockets).sink { [weak self] result in
            guard let weakSelf = self, let items = result.value else { return }
            weakSelf.isLoading = false
            weakSelf.items = items.map {
                RocketViewItem($0)
            }
        }.store(in: &disposables)
    }
    
    func showDetail(_ item: RocketViewItem) {
        listCoordinator.showDetail(item)
    }
}

// MARK: - Operation Management
extension ListViewModel {
    
    func suspendAllOperations() {
        pendingOperations.downloadQueue.isSuspended = true
    }
    
    func resumeAllOperations() {
        pendingOperations.downloadQueue.isSuspended = false
    }
    
    func loadImagesForOnscreenCells(_ paths: [IndexPath]) {
        
        let allPendingOperations = Set(pendingOperations.downloadsInProgress.keys)
        
        var toBeCancelled = allPendingOperations
        let visiblePaths = Set(paths)
        toBeCancelled.subtract(visiblePaths)
        
        var toBeStarted = visiblePaths
        toBeStarted.subtract(allPendingOperations)
        
        for indexPath in toBeCancelled {
            if let pendingDownload = pendingOperations.downloadsInProgress[indexPath] {
                pendingDownload.cancel()
            }
            pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
        }
        
        for indexPath in toBeStarted {
            let itemToProcess = items[indexPath.row]
            startOperations(for: itemToProcess, at: indexPath)
        }
    }
    
    func startOperations(for rocketViewItem: RocketViewItem, at indexPath: IndexPath) {
        switch (rocketViewItem.state) {
        case .new: startDownload(for: rocketViewItem, at: indexPath)
        case .downloaded: print("downloaded")
        default: print("do nothing")
        }
    }
    
    private func startDownload(for rocketViewItem: RocketViewItem, at indexPath: IndexPath) {

        guard pendingOperations.downloadsInProgress[indexPath] == nil else {
            return
        }
        
        let downloader = ImageDownloader(rocketViewItem)

        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
        
            self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
            self.refreshItems = [indexPath]
        }

        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
}
