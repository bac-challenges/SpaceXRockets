//
//  String.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import Foundation

extension String {
    
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = format
        
        guard let date = dateFormatter.date(from: self) else {
            print("Take a look to your format")
            return nil
        }
        
        return date
    }
}
