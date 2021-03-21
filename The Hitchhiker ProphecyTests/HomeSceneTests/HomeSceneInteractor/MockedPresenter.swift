//
//  MockedPresenter.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

class MockedPresenter: HomeScenePresentationLogic {
    var displayView: HomeSceneDisplayView?
    
    var presentCharactersWasCalled = false
    func presentCharacters(_ response: HomeScene.Search.Response) {
        presentCharactersWasCalled = true
    }
    
}
