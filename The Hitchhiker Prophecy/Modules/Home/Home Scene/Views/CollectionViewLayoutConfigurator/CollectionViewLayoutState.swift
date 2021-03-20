//
//  CollectionViewConfigurator.swift
//  The Hitchhiker Prophecy
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

protocol CollectionViewLayoutState {
    
    var homeSceneViewController: HomeSceneViewController? { get }
    
    func switchLayout()
    func setLayout()
}

class BaseCollectionViewLayoutState: CollectionViewLayoutState {
    
    weak var homeSceneViewController: HomeSceneViewController?
    
    init(_ homeSceneViewController: HomeSceneViewController?) {
        self.homeSceneViewController = homeSceneViewController
    }
    
    fileprivate lazy var horizontalState = HorizontalCollectionViewLayoutState(homeSceneViewController)
    fileprivate lazy var verticalState = VerticalCollectionViewLayoutState(homeSceneViewController)
    
    fileprivate lazy var horizontalCollectionViewLayout = horizontalFlowLayout(for: collectionView)
    fileprivate lazy var verticalCollectionViewLayout = verticalFlowLayout(for: collectionView)
    
    fileprivate var collectionView: UICollectionView? {
        homeSceneViewController?.collectionView
    }
    
    func switchLayout() {
        homeSceneViewController?.collectionViewLayoutState = self.otherState()
        collectionView?.collectionViewLayout = otherLayout()
    }
    func otherState() -> BaseCollectionViewLayoutState {
        fatalError()
    }
    func otherLayout() -> UICollectionViewLayout {
        fatalError()
    }

    func setLayout() {
        fatalError()
    }
 
}

class HorizontalCollectionViewLayoutState: BaseCollectionViewLayoutState {

    override func setLayout() {
        collectionView?.collectionViewLayout = horizontalCollectionViewLayout
    }
    override func otherState() -> BaseCollectionViewLayoutState {
        verticalState
    }
    override func otherLayout() -> UICollectionViewLayout {
        verticalCollectionViewLayout
    }
}

class VerticalCollectionViewLayoutState: BaseCollectionViewLayoutState {

    override func setLayout() {
        collectionView?.collectionViewLayout = verticalCollectionViewLayout
    }
    
    override func otherState() -> BaseCollectionViewLayoutState {
        horizontalState
    }
    
    override func otherLayout() -> UICollectionViewLayout {
        horizontalCollectionViewLayout
    }
}
