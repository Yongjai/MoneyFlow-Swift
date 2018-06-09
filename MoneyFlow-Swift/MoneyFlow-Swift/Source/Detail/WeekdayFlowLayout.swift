//
//  WeekdayFlowLayout.swift
//  MoneyFlow-Swift
//
//  Created by Yong Jae Kwon on 2018. 6. 9..
//  Copyright © 2018년 Yong Jae Kwon. All rights reserved.
//

import UIKit

class WeekdayFlowLayout: UICollectionViewFlowLayout {
    let cellsPerRow: Int = 7
    
    override var itemSize: CGSize {
        get {
            guard let collectionView = collectionView else {
                return super.itemSize
            }
            let insets = sectionInset.left + sectionInset.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - insets) / CGFloat(cellsPerRow)).rounded(.down)
            
            // TODO: Flow Layout 클래스를 하나만 두고 재사용하고 싶은데 어떻게 해결해야 할지 모르겠음.
            // height에서 *2만 제거하고 나머지는 다 같음
            return CGSize(width: itemWidth, height: itemWidth)
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
