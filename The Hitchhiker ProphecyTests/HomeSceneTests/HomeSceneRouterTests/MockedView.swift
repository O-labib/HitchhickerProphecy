//
//  MockedView.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit
@testable import The_Hitchhiker_Prophecy

class MockedView: UIViewController, UIViewControllerTransitioningDelegate, HomeSceneDisplayView {
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) { }
    func failedToFetchCharacters(error: Error) { }

    var didPresentOtherViewController = false
    
    override func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)? = nil
    ) {
        didPresentOtherViewController = true
    }
    
}
