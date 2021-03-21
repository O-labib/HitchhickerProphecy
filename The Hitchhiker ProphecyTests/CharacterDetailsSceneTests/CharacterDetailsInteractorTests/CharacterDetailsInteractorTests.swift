//
//  CharacterDetailsInteractorTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/21/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class CharacterDetailsInteractorTests: XCTestCase {

    private let mockedPresenter = MockedCharacterDetailsPresenter()
    private var interactor: CharacterDetailsSceneBusinessLogic!
    
    override func setUpWithError() throws {
        interactor = CharacterDetailsSceneInteractor(character: .any, presenter: mockedPresenter)
    }

    override func tearDownWithError() throws { }

    func test_fetchCharacter_delegatePresentationToPresenter() throws {
        interactor.fetchCharacter()
        XCTAssert(
            mockedPresenter.presentCharacterWasCalled,
            "presentation was not delegated to the presenter"
            )
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
