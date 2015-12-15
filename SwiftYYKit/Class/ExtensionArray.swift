//
//  ExtensionArray.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/15.
//  Copyright © 2015年 Double. All rights reserved.
//

import Foundation

extension NSArray {
  /**
   Returns the object located at a random index.
   
   @return The object in the array with a random index value.
   If the array is empty, returns nil.
   */
  func randomObject() -> AnyObject? {
    if self.count != 0 {
      return self[Int(arc4random())%self.count]
    }
    return nil
  }
  
  /**
   Returns the object located at index, or return nil when out of bounds.
   It's similar to `objectAtIndex:`, but it never throw exception.
   
   @param index The object located at index.
   */
  func objectOrNilAtIndex(index:Int) -> AnyObject? {
    return index < self.count ? self[index] : nil
  }
  
  /**
   Convert object to json string formatted. return nil if an error occurs.
   */
  func jsonStringEncoded() -> String {
    if NSJSONSerialization.isValidJSONObject(self) {
      do {
        let jsonData = try NSJSONSerialization.dataWithJSONObject(self, options: .PrettyPrinted)
        let json = String(data: jsonData, encoding: NSUTF8StringEncoding)
        return json!
      }
      catch let error as NSError {
        print(error)
      }
    }
    return ""
  }
}

extension NSMutableArray {
  /**
  Removes the object with the lowest-valued index in the array.
  If the array is empty, nothing will happen.
  */
  func removeFirstObject() {
    if self.count != 0 {
      self.removeObjectAtIndex(0)
    }
  }
  
  /**
  Removes the object with the highest-valued index in the array.
  If the array is empty, nothing will happen.
  
  @discussion Apple's implementation said it raises an NSRangeException if the
  array is empty, but in fact nothing will happen. Override for safe.
  */
//  func removeLastObject() {
//    
//  }
  
  /**
  Removes and returns the object with the lowest-valued index in the array.
  If the array is empty, it just returns nil.
  
  @return The first object, or nil.
  */
  func popFirstObject() -> AnyObject? {
    var obj:AnyObject?
    if self.count != 0 {
      obj = self.firstObject!
      self.removeFirstObject()
    }
    return obj
  }
  
  /**
  Removes and returns the object with the highest-valued index in the array.
  If the array is empty, it just returns nil.
  
  @return The first object, or nil.
  */
  func popLastObject() -> AnyObject? {
    var obj:AnyObject?
    if self.count != 0 {
      obj = self.lastObject!
      self.removeLastObject()
    }
    return obj
  }
  
  /**
  Inserts a given object at the end of the array.
  
  @param anObject The object to add to the end of the array's content.
  This value must not be nil. Raises an NSInvalidArgumentException if anObject is nil.
  */
  func appendObject(anObject:AnyObject) {
    self.addObject(anObject)
  }
  
  /**
  Inserts a given object at the beginning of the array.
  
  @param anObject The object to add to the end of the array's content.
  This value must not be nil. Raises an NSInvalidArgumentException if anObject is nil.
  */
  func prependObject(anObject:AnyObject) {
    self.insertObject(anObject, atIndex: 0)
  }
  
  /**
  Adds the objects contained in another given array to the end of the receiving
  array's content.
  
  @param objects An array of objects to add to the end of the receiving array's
  content. Nothing will happen if the objects is empty or nil.
  */
  func appendObjects(objects:[AnyObject]) {
    self.addObjectsFromArray(objects)
  }
  
  /**
  Adds the objects contained in another given array to the beginnin of the receiving
  array's content.
  
  @param objects An array of objects to add to the beginning of the receiving array's
  content. Nothing will happen if the objects is empty or nil.
  */
  func prependObjects(objects:[AnyObject]) {
    if objects.count != 0 {
      var i:Int = 0
      for obj in objects {
        self.insertObject(obj, atIndex: i++)
      }
    }
  }
  
  /**
  Adds the objects contained in another given array at the index of the receiving
  array's content.
  
  @param objects An array of objects to add to the receiving array's
  content. Nothing will happen if the objects is empty or nil.
  
  @param index The index in the array at which to insert objects. This value must
  not be greater than the count of elements in the array. Raises an
  NSRangeException if index is greater than the number of elements in the array.
  */
  func insertObjects(objects:[AnyObject], atIndex index:Int) {
    if objects.count != 0 {
      var i:Int = index
      for obj in objects {
        self.insertObject(obj, atIndex: i++)
      }
    }
  }
  
  /**
  Reverse the index of object in this array.
  Example: Before @[ @1, @2, @3 ], After @[ @3, @2, @1 ].
  */
  func reverse() {
    let count = self.count
    let mid = Int(floor(Double(count)/2.0))
    for i in 0..<mid {
      self.exchangeObjectAtIndex(i, withObjectAtIndex: (count-(i+1)))
    }
  }
  
  /**
  Sort the object in this array randomly.
  */
  func shuffle() {
    for var i = self.count; i > 1; i-- {
      self.exchangeObjectAtIndex((i-1), withObjectAtIndex: Int(arc4random_uniform(UInt32(i))))
    }
  }

}
