//
//  CustomFontViewController.swift
//  Chapter02-InputForm
//
//  Created by prologue on 2017. 6. 7..
//  Copyright © 2017년 rubypaper. All rights reserved.
//

import UIKit

class CustomFontViewController: UIViewController {
  
  override func viewDidLoad() {
    // 커스텀 폰트용 설정
    let customFont = UIFont(name: "SDMiSaeng", size: 30)
    
    let title01 = UILabel(frame: CGRect(x: 50, y: 100, width: 300, height: 30))
    title01.text = "커스텀 폰트가 적용된 텍스트"
    title01.font = customFont
    
    let title02 = UILabel(frame: CGRect(x: 50, y: 150, width: 300, height: 30))
    title02.text = "커스텀 폰트가 적용되지 않은 텍스트"
    
    self.view.addSubview(title01)
    self.view.addSubview(title02)
  }
}
