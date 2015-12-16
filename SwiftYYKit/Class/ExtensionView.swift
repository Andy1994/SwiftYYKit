//
//  ExtensionView.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/16.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  /**
   Create a snapshot image of the complete view hierarchy.
   This method should be called in main thread.
   */
  func snapshotImage() -> UIImage{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0)
    if self.respondsToSelector("drawViewHierarchyInRect:afterScreenUpdates:") {
      self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
    }
    else {
      self.layer.renderInContext(UIGraphicsGetCurrentContext()!)
    }
    let snap:UIImage =  UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return snap
  }
  
  /**
  Remove all subviews.
  
  @warning Never call this method inside your view's drawRect: method.
  */
  func removeAllSubviews() {
    while self.subviews.count != 0 {
      self.subviews.last?.removeFromSuperview()
    }
  }
  
  /**
  Returns the view's view controller (may be nil).
  */
  func viewController() -> UIViewController {
    for var view = self; ; view = view.superview! {
      let nextResponder:UIResponder = view.nextResponder()!
      if nextResponder.isKindOfClass(UIViewController.classForCoder()) {
        return nextResponder as! UIViewController
      }
    }
  }
  
  var left:CGFloat {
    return self.frame.origin.x
  }
  
  func setLeft(x:CGFloat) {
    var frame = self.frame
    frame.origin.x = x
    self.frame = frame
  }
  
  var top:CGFloat {
    return self.frame.origin.y
  }
  
  func setTop(y:CGFloat) {
    var frame = self.frame
    frame.origin.y = y
    self.frame = frame
  }
  
  var right:CGFloat {
    return self.frame.origin.x + self.frame.size.width
  }
  
  func setRight(right:CGFloat) {
    var frame = self.frame
    frame.origin.x = right - frame.size.width
    self.frame = frame
  }
  
  var bottom:CGFloat {
    return self.frame.origin.y + self.frame.size.height
  }
  
  func setBottom(bottom:CGFloat) {
    var frame = self.frame
    frame.origin.y = bottom - frame.size.height
    self.frame = frame
  }
  
  var width:CGFloat {
    return self.frame.size.width
  }
  
  func setWidth(width:CGFloat) {
    var frame = self.frame
    frame.size.width = width
    self.frame = frame
  }
  
  var height:CGFloat {
    return self.frame.size.height
  }
  
  func setHeight(height:CGFloat) {
    var frame = self.frame
    frame.size.height = height
    self.frame = frame
  }
  
  var centerX:CGFloat {
    return self.center.x
  }
  
  func setCenterX(centerX:CGFloat) {
    self.center = CGPoint(x: centerX, y: self.center.y)
  }
  
  var centerY:CGFloat {
    return self.center.y
  }
  
  func setCenterY(centerY:CGFloat) {
    self.center = CGPoint(x: self.center.x, y: centerY)
  }
  
  var origin:CGPoint {
    return self.frame.origin
  }
  
  func setOrigin(origin:CGPoint) {
    var frame = self.frame
    frame.origin = origin
    self.frame = frame
  }
  
  var size:CGSize {
    return self.frame.size
  }
  
  func setSize(size:CGSize) {
    var frame = self.frame
    frame.size = size
    self.frame = frame
  }
}
