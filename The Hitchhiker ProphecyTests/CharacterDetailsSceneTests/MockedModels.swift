//
//  MockedModels.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/21/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

extension CharacterDetailsScene.FetchCharacter.Response {
    static var any: CharacterDetailsScene.FetchCharacter.Response {
        return .init(id: 1, name: "", resultDescription: "", modified: "", thumbnail: .init(path: "", thumbnailExtension: ""), resourceURI: "", comics: .any, series: .any, stories: .any, events: .any, urls: [])
    }
}
