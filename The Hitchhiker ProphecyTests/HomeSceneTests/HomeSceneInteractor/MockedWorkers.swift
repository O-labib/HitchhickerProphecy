//
//  MockedWorker.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

class MockedWorkerForSuccess: HomeWorkerType {
    
    func getCharacters(_ input: Characters.Search.Input, completion: @escaping (HomeScene.Search.Response) -> Void) {
        completion(.success(.any))
    }
    
}

class MockedWorkerForFailure: HomeWorkerType {
    
    func getCharacters(_ input: Characters.Search.Input, completion: @escaping (HomeScene.Search.Response) -> Void) {
        completion(.failure(.unknown))
    }
    
}
