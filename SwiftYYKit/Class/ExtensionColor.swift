//
//  ExtensionColor.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/15.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  
  func randomColor() -> UIColor {
    let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    let green = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    return UIColor(red: red, green: green, blue: blue, alpha: 1)
  }
  
  
}
