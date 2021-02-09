//
//  ListModel.swift
//  SpaceXRockets
//
//  Created by emile on 08/02/2021.
//

import Combine
import Foundation
import Alamofire


protocol ListModelType: class, JSONDecoderInjected {
    func get(_ endPoint: EndPointType) -> DataResponsePublisher<[Rocket]>
}

final class ListModel: ListModelType {
    func get(_ endPoint: EndPointType) -> DataResponsePublisher<[Rocket]> {
        AF.request(endPoint.path).publishDecodable(type: [Rocket].self, decoder: jsonDecoder)
    }
}

final class ListModelMock: ListModelType {
    func get(_ endPoint: EndPointType) -> DataResponsePublisher<[Rocket]> {
        let path = Bundle.main.path(forResource: "Rockets", ofType: "json") ?? ""
        return AF.request(URL(fileURLWithPath: path)).publishDecodable(type: [Rocket].self, decoder: jsonDecoder)
    }
}
