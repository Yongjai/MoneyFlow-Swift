//
//  CalendarFlowLayout.swift
//  MoneyFlow-Swift
//
//  Created by Yong Jae Kwon on 2018. 6. 9..
//  Copyright © 2018년 Yong Jae Kwon. All rights reserved.
//

import UIKit

class CalendarFlowLayout: UICollectionViewFlowLayout {
    let cellsPerRow: Int = 7
    
    override var itemSize: CGSize {
        get {
            guard let collectionView = collectionView else {
                return super.itemSize
            }
            
            let insets = sectionInset.left + sectionInset.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - insets) / CGFloat(cellsPerRow)).rounded(.down)
            
            return CGSize(width: itemWidth, height: itemWidth*2)
        }
        set {
            super.itemSize = newValue
        }
    }
    
    init(sectionInset: UIEdgeInsets = .zero) {
        super.init()
        
        self.sectionInset = sectionInset
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error")
    }
}
