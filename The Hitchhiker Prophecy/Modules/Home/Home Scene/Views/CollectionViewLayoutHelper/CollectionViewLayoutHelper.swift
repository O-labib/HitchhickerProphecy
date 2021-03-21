//
//  CollectionViewLayoutConfigurator.swift
//  The Hitchhiker Prophecy
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

enum CollectionViewLayoutAspects { }

extension CollectionViewLayoutAspects {
    enum Horizontal {
        static let sideInsets: CGFloat = 12
        static let topInsets: CGFloat = 0
        static let cellToCollectionViewWidthRatio: CGFloat = 0.8
    }
}

extension CollectionViewLayoutAspects {
    enum Vertical {
        static let sideInsets: CGFloat = 8
        static let topInsets: CGFloat = 6
        static let cellHeight: CGFloat = 200
    }
}

func horizontalFlowLayout(for collectionView: UICollectionView?) -> UICollectionViewFlowLayout {
    guard let collectionView = collectionView else {
        return UICollectionViewFlowLayout()
    }
    let collectionFlowLayout = UICollectionViewFlowLayout()
    collectionFlowLayout.scrollDirection = .horizontal
    collectionFlowLayout.sectionInset = UIEdgeInsets(
        top: CollectionViewLayoutAspects.Horizontal.topInsets,
        left: CollectionViewLayoutAspects.Horizontal.sideInsets,
        bottom: CollectionViewLayoutAspects.Horizontal.topInsets,
        right: CollectionViewLayoutAspects.Horizontal.sideInsets
    )
    collectionFlowLayout.itemSize = CGSize(
        width: collectionView.frame.width * CollectionViewLayoutAspects.Horizontal.cellToCollectionViewWidthRatio,
        height: collectionView.frame.height
    )
    collectionFlowLayout.minimumInteritemSpacing = 0
    collectionFlowLayout.minimumLineSpacing = 2 * CollectionViewLayoutAspects.Horizontal.sideInsets
    return collectionFlowLayout
}

func verticalFlowLayout(for collectionView: UICollectionView?) -> UICollectionViewFlowLayout {
    guard let collectionView = collectionView else {
        return UICollectionViewFlowLayout()
    }
    let collectionFlowLayout = UICollectionViewFlowLayout()
    collectionFlowLayout.sectionInset = UIEdgeInsets(
        top: CollectionViewLayoutAspects.Vertical.topInsets,
        left: CollectionViewLayoutAspects.Vertical.sideInsets,
        bottom: CollectionViewLayoutAspects.Vertical.topInsets,
        right: CollectionViewLayoutAspects.Vertical.sideInsets
    )
    collectionFlowLayout.itemSize = CGSize(
        width: collectionView.frame.width - (2 * CollectionViewLayoutAspects.Vertical.sideInsets),
        height: CollectionViewLayoutAspects.Vertical.cellHeight
    )
    collectionFlowLayout.minimumInteritemSpacing = 0
    collectionFlowLayout.minimumLineSpacing = CollectionViewLayoutAspects.Vertical.topInsets * 2
    collectionFlowLayout.scrollDirection = .vertical
    return collectionFlowLayout
}
