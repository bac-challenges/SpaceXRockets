//
//  ImageDownloader.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import UIKit

final class PendingOperation {
    lazy var downloadsInProgress: [IndexPath: Operation] = [:]
    lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Download queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
}

final class ImageDownloader: Operation {

    let rocketViewItem: RocketViewItem
    
    init(_ rocketViewItem: RocketViewItem) {
        self.rocketViewItem = rocketViewItem
    }
    
    override func main() {

        if isCancelled {
            return
        }
        
        guard let url = URL(string: rocketViewItem.data.imageURL) else {
            return
        }
        
        guard let imageData = try? Data(contentsOf: url) else { return }
        
        if isCancelled {
            return
        }
        
        if !imageData.isEmpty {
            rocketViewItem.image = UIImage(data: imageData) ?? UIImage()
            rocketViewItem.state = .downloaded
        } else {
            rocketViewItem.state = .failed
            rocketViewItem.image = UIImage(named: "Failed") ?? UIImage()
        }
    }
}
