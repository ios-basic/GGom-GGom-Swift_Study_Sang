//
//  ViewController.swift
//  CSButton
//
//  Created by 유저 on 2021/05/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 30, y: 50, width: 150, height: 30)
        let csBtn = CSButton(frame: frame)
        self.view.addSubview(csBtn)
    }


}

