//
//  CharacterDetailsPresenterTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/21/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class CharacterDetailsPresenterTests: XCTestCase {
    
    private var presenter: CharacterDetailsScenePresentationLogic!
    private let view = MockedCharacterDetailsView()
    
    override func setUpWithError() throws {
        presenter = CharacterDetailsScenePresenter(displayView: view)
    }

    override func tearDownWithError() throws { }

    func test_presentCharacter_renderTheView() throws {
        presenter.presentCharacter(.any)
        XCTAssert(
            view.didFetchCharacterWasCalled,
            "result was not displayed on the view"
            )
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
