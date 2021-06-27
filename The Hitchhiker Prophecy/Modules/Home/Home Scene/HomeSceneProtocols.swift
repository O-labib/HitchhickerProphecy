//
//  HomeSceneProtocols.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/12/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol HomeSceneDisplayView: class {
    var interactor: HomeSceneBusinessLogic? { get }
    var router: HomeSceneRoutingLogic? { get }
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel])
    func failedToFetchCharacters(error: Error)
}

//sourcery: AutoMockable
protocol HomeSceneBusinessLogic: class {
    var worker: HomeWorkerType { get }
    var presenter: HomeScenePresentationLogic { get }
    
    func fetchCharacters()
}

//sourcery: AutoMockable
protocol HomeScenePresentationLogic: class {
    var displayView: HomeSceneDisplayView? { get }
    
    func presentCharacters(_ response: HomeScene.Search.Response)
}

//sourcery: AutoMockable
protocol HomeSceneDataStore: class {
    var result: Characters.Search.Results? { get }
}

//sourcery: AutoMockable
protocol HomeSceneDataPassing: class {
    var dataStore: HomeSceneDataStore? { get }
}

//sourcery: AutoMockable
protocol HomeSceneRoutingLogic: class {
    func routeToCharacterDetailsWithCharacter(at index: Int)
}

//sourcery: AutoMockable
protocol HomeWorkerType {
    func getCharacters(_ input: Characters.Search.Input, completion: @escaping (HomeScene.Search.Response) -> Void)
}
