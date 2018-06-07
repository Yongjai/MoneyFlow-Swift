//
//  Asset.swift
//  MoneyFlow-Swift
//
//  Created by Yong Jae Kwon on 2018. 6. 7..
//  Copyright © 2018년 Yong Jae Kwon. All rights reserved.
//

import RealmSwift

@objcMembers class Assets: Object {
    dynamic var item: String = ""
    let price = RealmOptional<Int>()
    
    convenience init(item: String, price: Int) {
        self.init()
        self.item = item
        self.price.value = price
    }
    
    func priceString() -> String? {
        guard let price = price.value else { return nil }
        return String(price)
    }
}
