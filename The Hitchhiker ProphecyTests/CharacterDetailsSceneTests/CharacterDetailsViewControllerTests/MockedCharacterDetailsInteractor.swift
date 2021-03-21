//
//  MockedInteractor.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/21/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

class MockedCharacterDetailsInteractor: CharacterDetailsSceneBusinessLogic {
    
    var characterWasFetched = false
    
    func fetchCharacter() {
        characterWasFetched = true
    }
    
}
