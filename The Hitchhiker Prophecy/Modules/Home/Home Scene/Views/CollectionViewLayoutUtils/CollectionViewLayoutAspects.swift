//
//  CollectionViewLayoutAspects.swift
//  The Hitchhiker Prophecy
//
//  Created by mac on 3/22/21.
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
