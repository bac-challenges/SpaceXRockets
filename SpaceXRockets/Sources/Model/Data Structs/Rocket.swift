//
//  Rocket.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import Foundation

struct Rocket: DataItem, Codable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case images = "flickr_images"
        case active
        case country
        case cost = "cost_per_launch"
        case firstFlight = "first_flight"
        case successRate = "success_rate_pct"
        case descr = "description"
        case url = "wikipedia"
    }
    
    let name: String
    let images: [String]
    let active: Bool
    let country: String
    let cost: Int
    let firstFlight: String
    let successRate: Int
    let descr: String
    let url: String
}

// MARK: Helpers
extension Rocket {
    var imageURL: String {
        return images.first ?? ""
    }
    
    var date: String {
        guard let date = firstFlight.toDate(withFormat: "yyy-MM-dd") else {
            return "N/A"
        }
        return date.toString(withFormat: "dd MMM yyyy")
    }
}
