//
//  CollectionViewLayoutConfigurator.swift
//  The Hitchhiker Prophecy
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

func horizontalFlowLayout(for collectionView: UICollectionView) -> UICollectionViewFlowLayout {
    
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


func verticalFlowLayout(for collectionView: UICollectionView) -> UICollectionViewFlowLayout {
    
    let collectionFlowLayout = UICollectionViewFlowLayout()
    collectionFlowLayout.scrollDirection = .vertical

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

    return collectionFlowLayout
}
