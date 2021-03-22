//
//  HomeCharacterCollectionViewCell+Extensions.swift
//  The Hitchhiker Prophecy
//
//  Created by mac on 3/22/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

extension HomeCharacterCollectionViewCell {
    var imageViewFrameAdjusted: CGRect {
        convert(characterImageView.frame, to: nil)
    }
}
