//
//  DetailViewController.swift
//  MoneyFlow-Swift
//
//  Created by Yong Jae Kwon on 2018. 6. 7..
//  Copyright © 2018년 Yong Jae Kwon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    var date = Date()
    
    let calendarLayout = CalendarFlowLayout(
        sectionInset: UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarCollectionView.setCollectionViewLayout(calendarLayout, animated: false)
    }
    
    func dateInfo(date: Date) -> DateComponents {
        let components = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day], from: date)
        
        return components
    }
    
    func firstWeekDayThisMonth(date: Date) -> Int {
        var components = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day], from: date)
        components.day = 1
        let firstDayOfMonthDate = Calendar.current.date(from: components)
        let firstWeekDay = Calendar.current.ordinality(of: Calendar.Component.weekday, in: Calendar.Component.weekOfMonth, for: firstDayOfMonthDate!)
        
        return firstWeekDay!
    }
    
    func numberOfDaysInMonth(myDate: Date) -> Int {
        let range: Range = Calendar.current.range(of: Calendar.Component.day, in: Calendar.Component.month, for: myDate as Date)!
        let numberOfDaysInMonth = range.count
        
        return numberOfDaysInMonth
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 36개보다 많을 수가 없음.
        return 36
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentDateComponents = dateInfo(date: Date())
        var indexPathComponent = dateInfo(date: date)
        indexPathComponent.day = indexPath.item - firstWeekDayThisMonth(date: date) + 2
        
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier:"calendarCell", for: indexPath) as! CalendarCollectionViewCell
        
        if indexPath.item < firstWeekDayThisMonth(date: date) - 1 {
            cell.dateLabel.text = ""
            cell.dayTotalLabel.text = ""
            cell.backgroundColor = UIColor.clear
            
        } else if indexPath.item >= firstWeekDayThisMonth(date: date) - 1 && (indexPath.item - firstWeekDayThisMonth(date: date) + 2) <= numberOfDaysInMonth(myDate: date) {
            cell.dateLabel.text = "\(indexPath.item - firstWeekDayThisMonth(date: date) + 2)"
            
            if currentDateComponents == indexPathComponent {
                cell.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            } else {
                cell.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            }
        } else {
            cell.backgroundColor = UIColor.clear
            cell.dateLabel.text = ""
            cell.dayTotalLabel.text = ""
        }
        
        return cell
    }
}




