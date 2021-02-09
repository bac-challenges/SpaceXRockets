//
//  Int.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import Foundation

extension Int {
    func toCurrency(_ currency: String = "usd") -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        formatter.maximumFractionDigits = 0
        
        let number = NSNumber(value: self)
        return formatter.string(from: number)!
    }
}
