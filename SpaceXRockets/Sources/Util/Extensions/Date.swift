//
//  Date.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import Foundation

extension Date {
    
    func toString(withFormat format: String = "yyyy-MM-dd") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
}
