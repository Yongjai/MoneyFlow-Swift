//
//  WeekdayView.swift
//  MoneyFlow-Swift
//
//  Created by Yong Jae Kwon on 2018. 6. 8..
//  Copyright © 2018년 Yong Jae Kwon. All rights reserved.
//

import UIKit

class WeekdayView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(weekdayStackView)
        
        var daysArr = ["일", "월", "화", "수", "목", "금", "토"]
        for index in 0..<7 {
            let label = UILabel()
            label.text=daysArr[index]
            label.textAlignment = .center
            weekdayStackView.addArrangedSubview(label)
        }
    }
    
    let weekdayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

