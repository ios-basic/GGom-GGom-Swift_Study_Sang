//
//  CSTabBarController.swift
//  CSTabBar
//
//  Created by 유저 on 2021/05/04.
//
import UIKit

class CSTabBarController: UITabBarController {
    let csView = UIView()
    let tableItem01 = UIButton(type: .system)
    let tableItem02 = UIButton(type: .system)
    let tableItem03 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isHidden = true
        
        let width = self.view.frame.width
        let height: CGFloat = 50
        let x: CGFloat = 0
        let y = self.view.frame.height - height
        
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = .brown
        self.view.addSubview(self.csView)
    }
}

