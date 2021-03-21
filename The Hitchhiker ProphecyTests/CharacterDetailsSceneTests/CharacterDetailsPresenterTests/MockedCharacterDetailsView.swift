//
//  Ch.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/21/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

class MockedCharacterDetailsView: CharacterDetailsSceneDisplayLogic {
    var interactor: CharacterDetailsSceneBusinessLogic?
    
    var didFetchCharacterWasCalled = false
    func didFetchCharacter(viewModel: CharacterDetailsScene.FetchCharacter.ViewModel) {
        didFetchCharacterWasCalled = true
    }
    
}
