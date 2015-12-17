//
//  ExtensionApplication.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/17.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation

import UIKit

extension UIApplication {
  /// "Documents" folder in this app's sandbox.
  var documentsURL:NSURL {
    do {
      let url = try NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
      return url
    }
    catch _ as NSError {
      return NSURL()
    }
  }
  
  /// "Caches" folder in this app's sandbox.
  var cachesURL:NSURL {
    do {
      let url = try NSFileManager.defaultManager().URLForDirectory(.CachesDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
      return url
    }
    catch _ as NSError {
      return NSURL()
    }
  }
  
  /// "Library" folder in this app's sandbox.
  var libraryURL:NSURL {
    do {
      let url = try NSFileManager.defaultManager().URLForDirectory(.LibraryDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
      return url
    }
    catch _ as NSError {
      return NSURL()
    }
  }
  
  /// Application's Bundle Name (show in SpringBoard).
  var appBundleName:String {
    return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String
  }
  
  /// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
  var appBundleID:String {
    return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleIdentifier") as! String
  }
  
  /// Application's Version.  e.g. "1.2.0"
  var appVersion:String {
    return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
  }
  
  /// Application's Build number. e.g. "123"
  var appBuildVersion:String {
    return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as! String
  }
  
  /// Current thread real memory used in byte. (0 when error occurs)
  var memoryUsage:UInt {
    var info = task_basic_info()
    var count = mach_msg_type_number_t(sizeofValue(info))/4
    let kerr: kern_return_t = withUnsafeMutablePointer(&info) {
      task_info(mach_task_self_,task_flavor_t(TASK_BASIC_INFO),task_info_t($0),&count)
    }
    
    if kerr == KERN_SUCCESS {
      return info.resident_size
    }
    else {
      return 0
    }
  }
}

