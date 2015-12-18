//
//  ViewController.swift
//  SwiftYYKit
//
//  Created by 王文博 on 15/12/15.
//  Copyright © 2015年 Double. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let imageView = UIImageView(frame: self.view.bounds)
    imageView.contentMode = .ScaleAspectFit
    imageView.image = UIImage(named: "Test1")?.roundedCornerImageWithCornerRadius(20)
    view.addSubview(imageView)
    
    let textField = UITextField(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    textField.textAlignment = .Center
    view.addSubview(textField)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

