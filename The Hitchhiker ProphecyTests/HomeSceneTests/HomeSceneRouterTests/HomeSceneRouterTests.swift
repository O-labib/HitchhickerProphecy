//
//  HomeSceneRouterTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class HomeSceneRouterTests: XCTestCase {

    let router = HomeSceneRouter()
    let mockedViewController = MockedView()
    let mockedDataStore = MockedDataStore()
    
    override func setUpWithError() throws {
        router.viewController = mockedViewController
        router.dataStore = mockedDataStore
    }

    override func tearDownWithError() throws {
        router.viewController = nil
        router.dataStore = nil
    }

    func test_routeToCharacterDetails_presentDetailsViewController() throws {
        router.routeToCharacterDetailsWithCharacter(at: .zero)
        XCTAssert(
            mockedViewController.didPresentOtherViewController,
            "no view controller was presented"
        )
    }

    func test_routeToCharacterDetailsWithNilDataStore_PresentNothing() throws {
        router.dataStore = nil
        router.routeToCharacterDetailsWithCharacter(at: .zero)
        XCTAssert(
            mockedViewController.didPresentOtherViewController == false,
            "a view controller was presented"
        )
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
