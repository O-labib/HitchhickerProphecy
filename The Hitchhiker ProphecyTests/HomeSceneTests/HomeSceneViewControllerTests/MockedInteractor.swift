//
//  MockedInteractor.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

class MockedInteractor: HomeSceneBusinessLogic {
    var worker: HomeWorkerType
    var presenter: HomeScenePresentationLogic
    
    init() {
        presenter = MockedPresenter()
        worker = MockedWorkerForSuccess()
    }

    var fetchCharactersWasCalled = false
    func fetchCharacters() {
        fetchCharactersWasCalled = true
    }
    
}

