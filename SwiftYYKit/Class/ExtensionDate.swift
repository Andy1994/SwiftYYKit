//
//  ExtensionDate.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/15.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation

extension NSDate {
  var year:Int {
    return NSCalendar.currentCalendar().component(.Year, fromDate: self)
  }
  
  var month:Int {
    return NSCalendar.currentCalendar().component(.Month, fromDate: self)
  }
  
  var day:Int {
    return NSCalendar.currentCalendar().component(.Day, fromDate: self)
  }
  
  var hour:Int {
    return NSCalendar.currentCalendar().component(.Hour, fromDate: self)
  }
  
  var minute:Int {
    return NSCalendar.currentCalendar().component(.Minute, fromDate: self)
  }
  
  var second:Int {
    return NSCalendar.currentCalendar().component(.Second, fromDate: self)
  }
  
  var nanosecond:Int {
    return NSCalendar.currentCalendar().component(.Nanosecond, fromDate: self)
  }
  
  var weekday:Int {
    return NSCalendar.currentCalendar().component(.Weekday, fromDate: self)
  }
  
  var weekdayOrdinal:Int {
    return NSCalendar.currentCalendar().component(.WeekdayOrdinal, fromDate: self)
  }
  
  var weekOfMonth:Int {
    return NSCalendar.currentCalendar().component(.WeekOfMonth, fromDate: self)
  }
  
  var weekOfYear:Int {
    return NSCalendar.currentCalendar().component(.WeekOfYear, fromDate: self)
  }
  
  var yearForWeekOfYear:Int {
    return NSCalendar.currentCalendar().component(.YearForWeekOfYear, fromDate: self)
  }
  
  var quarter:Int {
    return NSCalendar.currentCalendar().component(.Quarter, fromDate: self)
  }
  
  func isLeapYear() -> Bool {
    let year = self.year
    if year%400 == 0 || (year%100 != 0 && year%4 == 0) {
      return true
    }
    return false
  }
  
  /**
   Returns a date representing the receiver date shifted later by the provided number of years.
   
   @param years  Number of years to add.
   @return Date modified by the number of desired years.
   */
  func dateByAddingYears(years:Int) -> NSDate {
    let calender = NSCalendar.currentCalendar()
    let components = NSDateComponents()
    components.year = years
    return calender.dateByAddingComponents(components, toDate: self, options: .WrapComponents)!
  }
  
  /**
   Returns a date representing the receiver date shifted later by the provided number of months.
   
   @param months  Number of months to add.
   @return Date modified by the number of desired months.
   */
  func dateByAddingMonths(months:Int) -> NSDate {
    let calender = NSCalendar.currentCalendar()
    let components = NSDateComponents()
    components.month = months
    return calender.dateByAddingComponents(components, toDate: self, options: .WrapComponents)!
  }

  /**
   Returns a date representing the receiver date shifted later by the provided number of days.
   
   @param days  Number of days to add.
   @return Date modified by the number of desired days.
   */
  func dateByAddingDays(days:Int) -> NSDate {
    let aTimeInterval = self.timeIntervalSinceReferenceDate + Double(86400 * days)
    let newDate = NSDate(timeIntervalSinceReferenceDate: aTimeInterval)
    return newDate
  }
  
  /**
   Returns a date representing the receiver date shifted later by the provided number of hours.
   
   @param hours  Number of hours to add.
   @return Date modified by the number of desired hours.
   */
  func dateByAddingHours(hours:Int) -> NSDate {
    let aTimeInterval = self.timeIntervalSinceReferenceDate + Double(3600 * hours)
    let newDate = NSDate(timeIntervalSinceReferenceDate: aTimeInterval)
    return newDate
  }
  
  /**
   Returns a date representing the receiver date shifted later by the provided number of minutes.
   
   @param minutes  Number of minutes to add.
   @return Date modified by the number of desired minutes.
   */
  func dateByAddingMinutes(minutes:Int) -> NSDate {
    let aTimeInterval = self.timeIntervalSinceReferenceDate + Double(60 * minutes)
    let newDate = NSDate(timeIntervalSinceReferenceDate: aTimeInterval)
    return newDate
  }
  
  /**
   Returns a date representing the receiver date shifted later by the provided number of seconds.
   
   @param seconds  Number of seconds to add.
   @return Date modified by the number of desired seconds.
   */
  func dateByAddingSeconds(seconds:Int) -> NSDate {
    let aTimeInterval = self.timeIntervalSinceReferenceDate + Double(seconds)
    let newDate = NSDate(timeIntervalSinceReferenceDate: aTimeInterval)
    return newDate
  }
  
  /**
   Returns a formatted string representing this date.
   see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
   for format description.
   
   @param format   String representing the desired date format.
   e.g. @"yyyy-MM-dd HH:mm:ss"
   
   @return NSString representing the formatted date string.
   */
  func stringWithFormate(format:String) -> String {
    let formatter = NSDateFormatter()
    formatter.dateFormat = format
    formatter.locale = NSLocale.currentLocale()
    return formatter.stringFromDate(self)
  }
  
  /**
   Returns a formatted string representing this date.
   see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
   for format description.
   
   @param format    String representing the desired date format.
   e.g. @"yyyy-MM-dd HH:mm:ss"
   
   @param timeZone  Desired time zone.
   
   @param locale    Desired locale.
   
   @return NSString representing the formatted date string.
   */
  func stringWithFormate(format:String, timeZone:NSTimeZone, locale:NSLocale) -> String {
    let formatter = NSDateFormatter()
    formatter.dateFormat = format
    formatter.locale = locale
    formatter.timeZone = timeZone
    return formatter.stringFromDate(self)
  }
  
  /**
   Returns a date parsed from given string interpreted using the format.
   
   @param dataString The string to parse.
   
   @param format     The string's data format.
   
   @return A date representation of string interpreted using the format.
   If can not parse the string, returns nil.
   */
  class func dateWithString(dateString:String, formate:String) -> NSDate {
    let formatter = NSDateFormatter()
    formatter.dateFormat = formate
    return formatter.dateFromString(dateString)!
  }
  
  /**
   Returns a date parsed from given string interpreted using the format.
   
   @param dataString The string to parse.
   
   @param format     The string's data format.
   
   @param timeZone   The time zone, can be nil.
   
   @param locale     The locale, can be nil.
   
   @return A date representation of string interpreted using the format.
   If can not parse the string, returns nil.
   */
  class func dateWithString(dateString:String, formate:String, timeZone:NSTimeZone?, locale:NSLocale?) -> NSDate {
    let formatter = NSDateFormatter()
    formatter.dateFormat = formate
    if timeZone != nil {
      formatter.timeZone = timeZone
    }
    if locale != nil {
      formatter.locale = locale
    }
    return formatter.dateFromString(dateString)!
  }
}
