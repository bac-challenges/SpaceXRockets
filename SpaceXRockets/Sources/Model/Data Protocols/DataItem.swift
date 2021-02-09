//
//  DataItem.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import Foundation

protocol DataItem
{
    var name: String { get }
    var images: [String] { get }
    var active: Bool { get }
    var country: String { get }
    var cost: Int { get }
    var firstFlight: String { get }
    var successRate: Int { get }
    var descr: String { get }
    var url: String { get }
    
    var imageURL: String { get }
    var date: String { get }
}
