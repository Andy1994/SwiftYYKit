//
//  ExtensionNumber.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/17.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation
import UIKit

extension NSNumber {
  /**
   Creates and returns an NSNumber object from a string.
   Valid format: @"12", @"12.345", @" -0xFF", @" .23e99 "...
   
   @param string  The string described an number.
   
   @return an NSNumber when parse success, or nil if an error occurs.
   */
  class func numberWithString(string:String) -> NSNumber? {
    let str = string.stringByTrim().lowercaseString
    if !str.isNotBlank() || str.length == 0 {
      return nil
    }
    
    //hex number
    var sign:Int = 0
    if str.hasPrefix("0x") {
      sign = 1
    }
    else if str.hasPrefix("-0x") {
      sign = -1
    }
    if sign != 0 {
      let scan = NSScanner(string: str)
      //wrong here
      var num:CUnsignedInt = 1
      let suc = scan.scanHexInt(&num)
      if suc {
        return NSNumber(long: Int(num) * sign)
      }
      else {
        return nil
      }
    }
    
    //normal number
    let formatter = NSNumberFormatter()
    formatter.numberStyle = .DecimalStyle
    return formatter.numberFromString(string)
  }
}