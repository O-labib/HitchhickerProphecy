//
//  HomeSceneViewControllerTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class HomeSceneViewControllerTests: XCTestCase {

    private let homeSceneViewController = HomeSceneViewController()
    private let router = MockedHomeSceneRouterRouter()
    private let interactor = MockedHomeSceneInteractor()
    
    override func setUpWithError() throws {
        homeSceneViewController.router = router
        homeSceneViewController.interactor = interactor
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = homeSceneViewController
        _ = homeSceneViewController.view
    }

    override func tearDownWithError() throws {
    }

    func test_viewDidLoad_fetchCharacters() throws {
        XCTAssert(
            interactor.fetchCharactersWasCalled,
            "\"fetchCharacters\" should have been called"
            )
    }
    
    func test_didFetchCharacters_displayCorrectResultsOnCollectionView() throws {
        let anyThreeResults = HomeScene.Search.ViewModel.anyThreeItems
        homeSceneViewController.didFetchCharacters(viewModel: anyThreeResults)
        XCTAssert(
            homeSceneViewController.collectionView.numberOfItems(inSection: 0) == 3,
            "Wrong number of items displayed on the collection view"
            )
        
        XCTAssert(
            homeSceneViewController.collectionView(homeSceneViewController.collectionView,
                              cellForItemAt: .init(row: 0, section: 0)) is HomeCharacterCollectionViewCell,
            "Wrong collectionView cell returned for data loaded"
            )
        
    }
    
    func test_cellTap_callsRouterSuccessfully() throws {
        homeSceneViewController.collectionView(homeSceneViewController.collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
        XCTAssert(
            router.didRouteToCharacterDetails,
            "Tapping a cell should route to character details"
            )
    }
    
    func test_onError_DisplaysAlert() throws {
        homeSceneViewController.failedToFetchCharacters(error: NetworkError.server)
        let expectation = XCTestExpectation(description: "testErrorDisplaysAlert")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            XCTAssertTrue(
                self.homeSceneViewController.presentedViewController is UIAlertController,
                "No alerts ware presented on error"
                )
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 2)
    }
    
    func testSwitchCollectionViewLayout() throws {
        let initialLayout = homeSceneViewController.currentCollectionViewLayout()
        homeSceneViewController.switchLayoutHandler()
        let finalLayout = homeSceneViewController.currentCollectionViewLayout()
        XCTAssert(
            initialLayout != finalLayout,
            "CollectionView layout was not switched successfully"
            )
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
