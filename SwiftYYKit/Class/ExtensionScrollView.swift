//
//  ExtensionScrollView.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/16.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
  /**
  Scroll content to top with animation.
  */
  func scrollToTop() {
    scrollToTopAnimated(true)
  }
  
  /**
  Scroll content to bottom with animation.
  */
  func scrollToBottom() {
    scrollToBottomAnimated(true)
  }
  
  /**
  Scroll content to left with animation.
  */
  func scrollToLeft() {
    scrollToLeftAnimated(true)
  }
  
  /**
  Scroll content to right with animation.
  */
  func scrollToRight() {
    scrollToRightAnimated(true)
  }
  
  /**
  Scroll content to top.
  
  @param animated  Use animation.
  */
  func scrollToTopAnimated(animated:Bool) {
    var off = self.contentOffset
    off.y = 0 - self.contentInset.top
    self.setContentOffset(off, animated: animated)
  }
  
  /**
  Scroll content to bottom.
  
  @param animated  Use animation.
  */
  func scrollToBottomAnimated(animated:Bool) {
    var off = self.contentOffset
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom
    self.setContentOffset(off, animated: animated)
  }
  
  /**
  Scroll content to left.
  
  @param animated  Use animation.
  */
  func scrollToLeftAnimated(animated:Bool) {
    var off = self.contentOffset
    off.x = 0 - self.contentInset.left
    self.setContentOffset(off, animated: animated)
  }
  
  /**
  Scroll content to right.
  
  @param animated  Use animation.
  */
  func scrollToRightAnimated(animated:Bool) {
    var off = self.contentOffset
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right
    self.setContentOffset(off, animated: animated)
  }
}
