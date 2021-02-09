//
//  UIColor.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import UIKit
import SwiftUI

extension UIColor {
    
    /// Returns success rate color
    static func successRate(_ rate: Int) -> UIColor {
        switch rate {
        case 0...29: return .red
        case 30...59: return .orange
        case 60...100: return .green
        default: return .gray
        }
    }

    /// The SwiftUI color associated with the receiver.
    var suiColor: Color { Color(self) }
}
