//
//  ExtensionViewController.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/18.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  //MARK: - Notifications
  func addNotificationObserver(name: String, selector: Selector) {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: name, object: nil)
  }
  
  func removeNotificationObserver(name: String) {
    NSNotificationCenter.defaultCenter().removeObserver(self, name: name, object: nil)
  }
  
  func removeNotificationObserver() {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  // MARK: - VC Flow
  
  func pushVC(vc: UIViewController) {
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func popVC() {
    navigationController?.popViewControllerAnimated(true)
  }
  
  func presentVC(vc: UIViewController) {
    presentViewController(vc, animated: true, completion: nil)
  }
  
  func dismissVC(completion completion: (() -> Void)? ) {
    dismissViewControllerAnimated(true, completion: completion)
  }
}