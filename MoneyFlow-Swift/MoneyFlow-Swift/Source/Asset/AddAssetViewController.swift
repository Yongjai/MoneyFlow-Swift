//
//  AddAssetViewController.swift
//  MoneyFlow-Swift
//
//  Created by Yong Jae Kwon on 2018. 6. 7..
//  Copyright © 2018년 Yong Jae Kwon. All rights reserved.
//

import UIKit
import RealmSwift

class AddAssetViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    var assets: Results<Assets>!
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = RealmService.shared.realm
        assets = realm.objects(Assets.self)
    }
    
    func updateAssets(assets: Assets) {
    }
    
    @IBAction func addAssetBtnClicked(_ sender: Any) {
        let newAsset = Assets(item: itemTextField.text!, price: Int(priceTextField.text!)!)
        
        RealmService.shared.create(newAsset)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func dismissBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
