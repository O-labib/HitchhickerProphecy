//
//  CollectionView+Extensions.swift
//  The Hitchhiker Prophecy
//
//  Created by mac on 3/20/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

extension UICollectionView {
    private var isHorizontal: Bool {
        (collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection == .horizontal
    }
    
    /// snap the closest cell to the centre only if collection view has horizontal layout
    /// this is to make sure cards are peeking from both sides
    func scrollToNearestCellIfHasHorizontalLayout() {
        guard isHorizontal else { return }
        
        let visibleCenterPositionOfScrollView = Float(self.contentOffset.x + (self.bounds.size.width / 2))
        var closestCellIndex = -1
        var closestCellCentreOffset: Float = .greatestFiniteMagnitude
        
        for i in 0..<self.visibleCells.count {
            let cell = self.visibleCells[i]
            let cellWidth = cell.bounds.size.width
            let cellCenter = Float(cell.frame.origin.x + cellWidth / 2)
            
            let cellCentreOffset: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
            if cellCentreOffset < closestCellCentreOffset {
                closestCellCentreOffset = cellCentreOffset
                closestCellIndex = self.indexPath(for: cell)?.row ?? -1
            }
        }
        if closestCellIndex != -1 {
            self.scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}
