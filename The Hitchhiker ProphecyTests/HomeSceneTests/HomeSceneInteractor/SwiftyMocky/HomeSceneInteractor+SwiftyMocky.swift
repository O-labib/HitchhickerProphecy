//
//  HomeSceneInteractor+SwiftyMocky.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Omar Labib on 27/06/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import The_Hitchhiker_Prophecy

class HomeSceneInteractor_SwiftyMocky: XCTestCase {

    private var interactor: HomeSceneBusinessLogic!
    private let mockedPresenter = HomeScenePresentationLogicMock()
    private let worker = HomeWorkerTypeMock()
    override func setUpWithError() throws {
        interactor = HomeSceneInteractor(worker: worker, presenter: mockedPresenter)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_fetchCharactersOnInteractorWithSuccessWorker_presentsCharacters() throws {
        
        // Given - success worker
        worker.matcher.register(Characters.Search.Output.self) { l, r in
            l.data.count == r.data.count
        }
        
        Perform(worker, .getCharacters(.any, completion: .any, perform: { input, completion in
            completion(.success(.any))
        }))

        interactor.fetchCharacters()
        
        Verify(mockedPresenter, .presentCharacters(.matching({ response in
            guard case .success = response else {
                return false
            }
            return true
        })))
    }
    
    func test_fetchCharactersOnInteractorWithFailureWorker_presentsCharacters() throws {
        
        // Given - failure worker
        Perform(worker, .getCharacters(.any, completion: .any, perform: { input, completion in
            completion(.failure(.unknown))
        }))
        
        interactor.fetchCharacters()
        Verify(mockedPresenter, .presentCharacters(.matching({ response in
            guard case .failure(let error) = response else {
                return false
            }
            return error == .unknown
        })))
    }

}
