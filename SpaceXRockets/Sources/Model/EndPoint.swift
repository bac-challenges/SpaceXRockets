//
//  EndPoint.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
}

enum EndPoint: EndPointType {
    
    case rockets
    case rocket(id: String)
    
    var baseURL: URL {
        return URL(string: "https://api.spacexdata.com/v4/")!
    }
    
    var path: String {
        switch self {
        case .rockets: return "\(baseURL)rockets"
        case .rocket(let id): return "\(baseURL)rockets/\(id)"
        }
    }
}
