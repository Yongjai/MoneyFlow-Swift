//
//  CalendarViewController.swift
//  MoneyFlow-Swift
//
//  Created by Yong Jae Kwon on 2018. 6. 8..
//  Copyright © 2018년 Yong Jae Kwon. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    func createCalendar() {
        var dayNum: Int = 0
        var _weekDay: Int = 0
        var _month: Int = 0
        var _year: Int = 0
    
        let gregorian = NSCalendar(calendarIdentifier: .gregorian)
        let calendar = Calendar.current
        var components = calendar.dateComponents([.day,.month,.year], from: Date())
        components.day = 1
        components.month = _month
        components.year = _year
        
        var newDate = calendar.date(from: components)
        var newComponents = gregorian?.component(NSCalendar.Unit.weekday, from: newDate!)
    
//        _weekday=[newComponents weekday]
//
//        _dayNum = [self getCurrentDateInfo:newDate];
//        NSUInteger newWeekDay = _weekday - 1;
//
//        int yVal = 40;
//        int count = 1;
        
    }
    
    func getCurrentDateInfo(myDate: NSDate) -> UInt {
        let calendar = NSCalendar.current
        var range: NSRange = calendar.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: myDate as Date)
//        var range = calendar.range(of:NSCalendar.Unit.day in: NSCalendar.Unit.month, for: myDate as Date)
        
    }
//    (NSUInteger)getCurrentDateInfo:(NSDate *)myDate {
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:myDate];
//    NSUInteger numberOfDaysInMonth = range.length;
//    return numberOfDaysInMonth;
//    }
}

