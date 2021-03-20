//
//  HomeScenePresenter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class HomeScenePresneter: HomeScenePresentationLogic {
    weak var displayView: HomeSceneDisplayView?
    
    init(displayView: HomeSceneDisplayView) {
        self.displayView = displayView
    }
    
    func presentCharacters(_ response: HomeScene.Search.Response) {
        switch response {
            case .success(let output):
                let viewSuccessModel = output.data.results.map(createHomeSceneViewModel(from:))
                displayView?.didFetchCharacters(viewModel: viewSuccessModel)
            case .failure(let error):
                displayView?.failedToFetchCharacters(error: error)
                break
        }
    }
    
    private func createHomeSceneViewModel(from character: Characters.Search.Character) -> HomeScene.Search.ViewModel {
        return HomeScene.Search.ViewModel(
            name: character.name,
            desc: character.resultDescription,
            imageUrl: character.thumbnail.uncannyPortraitImageUrl,
            comics: character.comics.collectionURI,
            series: character.series.collectionURI,
            stories: character.stories.collectionURI,
            events: character.events.collectionURI
        )
    }
}

private extension Characters.Search.Character.Thumbnail {
    var uncannyPortraitImageUrl: String {
        """
        \(path)\
        /\(CharacterDetailsScene.Constants.ImageSize.Portrait.uncanny.rawValue)\
        .\(thumbnailExtension)
        """
    }
}
