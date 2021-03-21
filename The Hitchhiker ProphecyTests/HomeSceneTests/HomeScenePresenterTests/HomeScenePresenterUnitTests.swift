//
//  HomeScenePresenterUnitTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class HomeScenePresenterUnitTests: XCTestCase {

    private let mockedView = HomeSceneMockedView()
    private var presenter: HomeScenePresentationLogic!
    
    override func setUpWithError() throws {
        presenter = HomeScenePresneter(displayView: mockedView)
    }

    override func tearDownWithError() throws {
        presenter = nil
    }

    func test_presentSuccessResponse_displayResultsOnView() throws {
        presenter.presentCharacters(.success(.any))
        XCTAssert(
            mockedView.charactersWereFetched == true,
            "\"didFetchCharacters\" should have been called on the view"
        )
    }
    func test_presentSuccessResponse_displayCorrectResultsOnView() throws {
        presenter.presentCharacters(.success(.mockedResult))
        XCTAssert(
            mockedView.viewModel.first?.name == .uniqueName,
            "\"didFetchCharacters\" should have been called on the view"
        )
    }

    func test_presentFailureResponse_displayNoResultsOnView() throws {
        presenter.presentCharacters(.failure(.server))
        XCTAssert(
            mockedView.charactersWereFetched == false,
            "\"failedToFetchCharacters\" should have been called on the view"
        )
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

