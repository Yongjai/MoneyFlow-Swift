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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
