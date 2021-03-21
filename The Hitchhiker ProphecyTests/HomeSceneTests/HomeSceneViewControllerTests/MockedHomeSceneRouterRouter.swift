//
//  MockedRouter.swift
//  The Hitchhiker ProphecyTests
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit
@testable import The_Hitchhiker_Prophecy

class MockedHomeSceneRouterRouter: HomeSceneRoutingLogic {
    
    var viewController: (UIViewController & HomeSceneDisplayView & UIViewControllerTransitioningDelegate)?
    
    var didRouteToCharacterDetails = false
    func routeToCharacterDetailsWithCharacter(at index: Int) {
        didRouteToCharacterDetails = true
    }
    
    
}
