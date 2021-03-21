//
//  ModelsMock.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation
@testable import The_Hitchhiker_Prophecy

extension Characters.Search.Results {
    static var any: Characters.Search.Results {
        .init(
            offset: 1,
            limit: 1,
            total: 1,
            count: 1,
            results: []
        )
    }
    
    static var mockedResult: Characters.Search.Results {
        .init(
            offset: 1,
            limit: 1,
            total: 1,
            count: 1,
            results: [.init(
                id: 2,
                name: .uniqueName,
                resultDescription: "",
                modified: "",
                thumbnail: .init(path: "", thumbnailExtension: ""),
                resourceURI: "",
                comics: .any,
                series: .any,
                stories: .any,
                events: .any,
                urls: []
            )]
        )
    }
}
extension String {
    static var uniqueName = "name"
}
extension Characters.Search.Character.Comics {
    static var any: Characters.Search.Character.Comics {
        .init(available: 0, collectionURI: "", items: [], returned: 0)
    }
}

extension Characters.Search.Character.Stories {
    static var any: Characters.Search.Character.Stories {
        .init(available: 0, collectionURI: "", items: [], returned: 0)
    }
}
extension Characters.Search.Output {
    static var any: Characters.Search.Output {
        return Characters.Search.Output(
            code: 0,
            status: "",
            copyright: "",
            attributionText: "",
            attributionHTML: "",
            etag: "",
            data: .any
        )
    }
    /// single item with name = .uniqueName
    static var mockedResult: Characters.Search.Output {
        return Characters.Search.Output(
            code: 0,
            status: "",
            copyright: "",
            attributionText: "",
            attributionHTML: "",
            etag: "",
            data: .mockedResult
        )
    }
    
}

extension HomeScene.Search.ViewModel {
    static var any: HomeScene.Search.ViewModel {
        return .init(name: "", desc: "", imageUrl: "", comics: "", series: "", stories: "", events: "")
    }
    static var anyThreeItems: [HomeScene.Search.ViewModel] {
        return [
            .any, .any, .any
        ]
    }
}
