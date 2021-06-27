//
//  HomeSceneTests+SwiftyMocky.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Omar Labib on 27/06/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import The_Hitchhiker_Prophecy

class HomeSceneVC_SwiftyMocky: XCTestCase {

    let homeSceneVc = HomeSceneViewController()
    let router = HomeSceneRoutingLogicMock()
    let interactor = HomeSceneBusinessLogicMock()
    
    override func setUpWithError() throws {
        homeSceneVc.router = router
        homeSceneVc.interactor = interactor
        homeSceneVc.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_viewDidLoad_fetchCharacters() throws {
        Verify(interactor, .fetchCharacters())
    }
    
    func test_cellTap_callsRouterSuccessfully() throws {
        // Given
        let indexPath = IndexPath.init(row: 0, section: 0)
        homeSceneVc.collectionView(homeSceneVc.collectionView, didSelectItemAt: indexPath)
        
        Verify(router, .routeToCharacterDetailsWithCharacter(at: .value(indexPath.row)))
    }

}
