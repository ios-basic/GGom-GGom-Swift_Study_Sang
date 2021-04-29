//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by 유저 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("테스트 버튼", for: UIControl.State.normal)
        
        // 루트 뷰 버튼 추가
        self.view.addSubview(btn)
        // 버튼 수평 중앙 정렬
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        // 루트 뷰 버튼 추가
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
    
    }
    @objc func btnOnClick(_ sender: Any) {
            // 호출한 객체가 버튼이라면
            if let btn = sender as? UIButton {
                btn.setTitle("클릭 되었습니다.", for: UIControl.State.normal)
            }
        }
}

