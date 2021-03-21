//
//  CharacterDetailsViewControllerTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/21/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class CharacterDetailsViewControllerTests: XCTestCase {

    private let characterDetailsViewController = CharacterDetailsSceneViewController()
    private let interactor = MockedCharacterDetailsInteractor()
    
    override func setUpWithError() throws {
        characterDetailsViewController.interactor = interactor
        _ = characterDetailsViewController.view
    }

    override func tearDownWithError() throws {
        characterDetailsViewController.interactor = nil
    }

    func test_viewDidLoad_fetchResult() throws {
        XCTAssert(interactor.characterWasFetched)
    }

    func test_didFetchCharacter_bindViewsSuccessfully() throws {
        let name = "name"
        let description = "description"
        let imageUrl = ""
        characterDetailsViewController.didFetchCharacter(viewModel: .init(name: name,
                                                                          description: description,
                                                                          imageURL: imageUrl))
        XCTAssert(
            characterDetailsViewController.characterNameLabel.text == name,
            "characterNameLabel was not bound successfully"
            )
        XCTAssert(
            characterDetailsViewController.characterDescriptionLabel.text == description,
            "characterNameLabel was not bound successfully"
        )
        XCTAssert(
            characterDetailsViewController.characterImageView.image == UIImage(named: "placeHolder"),
            "characterImageView was not bound successfully"
        )
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
