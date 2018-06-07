//
//  AssetTableViewCell.swift
//  MoneyFlow-Swift
//
//  Created by Yong Jae Kwon on 2018. 6. 7..
//  Copyright © 2018년 Yong Jae Kwon. All rights reserved.
//

import UIKit

class AssetTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(with asset: Assets) {
        itemLabel.text = asset.item
        priceLabel.text = asset.priceString()
    }
}
