//
//  CSButton.swift
//  CSButton
//
//  Created by 유저 on 2021/05/02.
//

import UIKit

class CSButton: UIButton {
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        
        //스토리 보드 방식으로 버튼 정의 시 적용
        self.backgroundColor = .green
        self.layer.borderWidth = 2 // 테두리 족므 두껍게
        self.layer.borderColor = UIColor.black.cgColor //테두리 검은색
        self.setTitle("버튼", for: .normal) // 기본 문구 설정 
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.layer.borderWidth = 2 // 테두리 족므 두껍게
        self.layer.borderColor = UIColor.black.cgColor //테두리 검은색
        self.setTitle("코드로 생성된 버튼", for: .normal) // 기본 문구 설정
    }
    
}
