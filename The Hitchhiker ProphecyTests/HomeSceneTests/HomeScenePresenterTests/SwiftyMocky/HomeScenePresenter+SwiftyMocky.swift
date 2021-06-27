//
//  HomeScenePresenter+SwiftyMocky.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Omar Labib on 27/06/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import The_Hitchhiker_Prophecy

class HomeScenePresenter_SwiftyMocky: XCTestCase {
    
    private var presenter: HomeScenePresneter!
    private let mockedView = HomeSceneDisplayViewMock()
    
    override func setUpWithError() throws {
        presenter = .init(displayView: mockedView)
    }

    func test_presentSuccessResponse_displayResultsOnView() throws {
        Matcher.default.register(Characters.Search.Output.self) { l, r in
            l.data.count == r.data.count
        }
        Verify(mockedView, .didFetchCharacters(viewModel: .any))
    }
    
    func test_presentFailureResponse_displayNoResultsOnView() throws {
        presenter.presentCharacters(.failure(.server))
        Verify(mockedView, 0 , .didFetchCharacters(viewModel: .any))
        Verify(mockedView, .failedToFetchCharacters(error: .matching({ error in
            return error as? NetworkError != nil
        })))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
