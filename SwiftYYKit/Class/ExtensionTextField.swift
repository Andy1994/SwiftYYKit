//
//  ExtensionTextField.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/16.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
  /**
  Set all text selected.
  */
  func selectAllText() {
    let range = self.textRangeFromPosition(self.beginningOfDocument, toPosition: self.endOfDocument)
    self.selectedTextRange = range
  }
  
  /**
  Set text in range selected.
  
  @param range  The range of selected text in a document.
  */
  func setSelectedRange(range:NSRange) {
    let beginning = self.beginningOfDocument
    let startPosition = self.positionFromPosition(beginning, offset: range.location)
    let endPosition = self.positionFromPosition(beginning, offset: NSMaxRange(range))
    let selectionRange = self.textRangeFromPosition(startPosition!, toPosition: endPosition!)
    self.selectedTextRange = selectionRange
  }
}