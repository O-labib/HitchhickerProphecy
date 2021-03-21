//
//  MockedCharacterDetailsPresenter.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/21/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

class MockedCharacterDetailsPresenter: CharacterDetailsScenePresentationLogic {
    var displayView: CharacterDetailsSceneDisplayLogic?
    
    var presentCharacterWasCalled = false
    func presentCharacter(_ response: CharacterDetailsScene.FetchCharacter.Response) {
        presentCharacterWasCalled = true
    }
    
    
}
