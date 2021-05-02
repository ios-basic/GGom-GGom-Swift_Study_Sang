//
//  CSStepper.swift
//  CSStepper
//
//  Created by 유저 on 2021/05/02.
//

import UIKit

class CSStepper: UIView {
    
    public var leftBtn = UIButton(type: .system)
    public var rightBtn = UIButton(type: .system)
    public var centerLabel = UILabel()
    public var value:Int = 0 // 스테퍼 현재 값 저장 변수
//    let stepper = CSStepper()
    
    //스토리보드에서 호출할 초기화 메소드
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    // 프로그래밍 방식으로 호출할 초기화 메소드
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    private func setup(){
        //스테퍼 기본 속성 설정
        // 좌측 다운 버튼 속성 설정
        let borderWidth:CGFloat = 0.5
        let borderColor = UIColor.blue.cgColor
        
        self.leftBtn.tag = -1  // 태그값 -1 부여
        self.leftBtn.setTitle("↓", for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //버튼 타이틀의 폰트
        self.leftBtn.layer.borderWidth = borderWidth// 버튼 테이블 두께
        self.leftBtn.layer.borderColor = borderColor // 버튼 테두리 파란색
        
        // 우측 다운 버튼 속성 설정
        self.rightBtn.tag = -1  // 태그값 -1 부여
        self.rightBtn.setTitle("↑", for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //버튼 타이틀의 폰트
        self.rightBtn.layer.borderWidth = borderWidth // 버튼 테이블 두께
        self.rightBtn.layer.borderColor = borderColor // 버튼 테두리 파란색
        
        //중앙 레이블 설정
        self.centerLabel.text = String(value) // 값을 문자열로 변환하여 표시
        self.centerLabel.font = UIFont.systemFont(ofSize: 15)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = .cyan
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = borderColor
        
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerLabel)
    }
}
