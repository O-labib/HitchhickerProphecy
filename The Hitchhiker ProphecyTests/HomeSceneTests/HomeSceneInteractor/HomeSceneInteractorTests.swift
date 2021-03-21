//
//  HomeSceneInteractorTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class HomeSceneInteractorTests: XCTestCase {

    private var interactor: HomeSceneBusinessLogic!
    private let mockedPresenter = MockedHomeScenePresenter()
    
    override func setUpWithError() throws { }
    override func tearDownWithError() throws {}

    func test_fetchCharactersOnInteractorWithSuccessWorker_presentsCharacters() throws {
        interactor = HomeSceneInteractor(worker: MockedWorkerForSuccess(),
                                         presenter: mockedPresenter)
        interactor.fetchCharacters()
        XCTAssert(
            mockedPresenter.presentCharactersWasCalled,
            "\"presentCharacters\" should have been called"
            )
    }

    
    func test_fetchCharactersOnInteractorWithFailureWorker_presentsCharacters() throws {
        interactor = HomeSceneInteractor(worker: MockedWorkerForFailure(),
                                         presenter: mockedPresenter)
        interactor.fetchCharacters()
        XCTAssert(
            mockedPresenter.presentCharactersWasCalled,
            "\"presentCharacters\" should have been called"
        )
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
