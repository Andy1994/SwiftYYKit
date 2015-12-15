//
//  ExtensionString.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/15.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation

extension String {
  var MD5: String! {
    let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
    let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
    let digestLen = Int(CC_MD5_DIGEST_LENGTH)
    let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
    CC_MD5(str!, strLen, result)
    let hash = NSMutableString()
    for i in 0..<digestLen {
      hash.appendFormat("%02x", result[i])
    }
    result.dealloc(digestLen)
    return String(format: hash as String)
  }
  
}
