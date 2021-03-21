//
//  MockedDataStore.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

class MockedDataStore: HomeSceneDataStore {
    var result: Characters.Search.Results? {
        return .mockedResult
    }
}
