//
//  HomeSceneMockedView.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

class MockedHomeSceneView: HomeSceneDisplayView {
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    
    var charactersWereFetched: Bool?
    var viewModel: [HomeScene.Search.ViewModel] = []
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        charactersWereFetched = true
        self.viewModel = viewModel
    }
    
    func failedToFetchCharacters(error: Error) {
        charactersWereFetched = false
    }
    
    
}
