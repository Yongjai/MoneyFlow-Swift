//
//  AssetViewController.swift
//  MoneyFlow-Swift
//
//  Created by Yong Jae Kwon on 2018. 6. 7..
//  Copyright © 2018년 Yong Jae Kwon. All rights reserved.
//

import UIKit

class AssetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var assetTableView: UITableView!
    let sections: [String] = ["자산", "잔액"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        
        let label = UILabel()
        label.text = sections[section]
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.frame = CGRect(x: 20, y: 0, width: 40, height: 50)
        view.addSubview(label)
        
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 40)
        button.frame = CGRect(x: 350, y: 0, width: 50, height: 50)
        view.addSubview(button)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assetTableView.dequeueReusableCell(withIdentifier: "assetCell") as! AssetTableViewCell
    
        return cell
    }
    
}
