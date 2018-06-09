//
//  DetailViewController.swift
//  MoneyFlow-Swift
//
//  Created by Yong Jae Kwon on 2018. 6. 7..
//  Copyright © 2018년 Yong Jae Kwon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    @IBOutlet weak var weekdayCollectionView: UICollectionView!
    
    let weekdays: [String] = ["일", "월", "화", "수", "목", "금", "토"]
    var date = Date()
    
    let calendarLayout = CalendarFlowLayout(sectionInset: UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5))
    let weekdaysLayout = WeekdayFlowLayout(sectionInset: UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarCollectionView.setCollectionViewLayout(calendarLayout, animated: false)
        weekdayCollectionView.setCollectionViewLayout(weekdaysLayout, animated: false)
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
        if collectionView == weekdayCollectionView {
            return 7
        }
        
        return 36
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentDateComponents = dateInfo(date: Date())
        var indexPathComponent = dateInfo(date: date)
        indexPathComponent.day = indexPath.item - firstWeekDayThisMonth(date: date) + 2
        
        if collectionView == weekdayCollectionView {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:"weekdayCell", for: indexPath) as! WeekdayCollectionViewCell
            cell.weekdayLabel.text = weekdays[indexPath.item]
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"calendarCell", for: indexPath) as! CalendarCollectionViewCell
        
        if indexPath.item < firstWeekDayThisMonth(date: date) - 1 {
            cell.dateLabel.text = ""
            cell.dayTotalLabel.text = ""
            cell.backgroundColor = UIColor.clear
            
        } else if indexPath.item >= firstWeekDayThisMonth(date: date) - 1 && (indexPath.item - firstWeekDayThisMonth(date: date) + 2) <= numberOfDaysInMonth(myDate: date) {
            cell.dateLabel.text = "\(indexPath.item - firstWeekDayThisMonth(date: date) + 2)"
            cell.layer.borderWidth = 0.2
            cell.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
            if currentDateComponents == indexPathComponent {
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




