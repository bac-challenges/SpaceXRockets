//
//  RocketViewItem.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import UIKit

final class RocketViewItem {
    
    enum State {
        case new, downloaded, failed
    }
    
    let data: DataItem
    
    var image = UIImage()
    var state = State.new
    
    init(_ data: DataItem) {
        self.data = data
    }
}
