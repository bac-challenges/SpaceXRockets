//
//  ConfigurableCell.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import Foundation

public protocol ConfigurableCell {
    associatedtype T
    func configure(_ item: T)
}
