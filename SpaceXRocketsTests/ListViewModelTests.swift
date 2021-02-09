//
//  ListViewModelTests.swift
//  SpaceXRocketsTests
//
//  Created by emile on 08/02/2021.
//
@testable import SpaceXRockets
import XCTest
import Combine

class ListViewModelTests: XCTestCase, ListModelInjected, ListViewModelInjected {
    
    var disposables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        InjectionMap.listModel = ListModelMock()
        disposables = []
    }
    
    func testInhection() {
        XCTAssertNotNil(listViewModel.listCoordinator)
        XCTAssertNotNil(listViewModel.listCoordinator.splitViewController)
        XCTAssertNotNil(listViewModel.listCoordinator.storyboard)
        XCTAssertNotNil(listViewModel.listCoordinator.detailCoordinator)
        XCTAssertNotNil(listViewModel.listModel)
        XCTAssertNotNil(listViewModel.listModel.jsonDecoder)
    }

    func testListViewModelGet() throws {
        listViewModel.get()
        listViewModel.$items.count().sink { value in
            XCTAssertEqual(value, 3)
        }.store(in: &disposables)
    }
}
