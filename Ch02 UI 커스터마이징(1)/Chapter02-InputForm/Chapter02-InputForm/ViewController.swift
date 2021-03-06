//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by 유저 on 2021/04/29.
//

import UIKit

class ViewController: UIViewController {
    //  입력용 테이블
    var paramEmail: UITextField!
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    
    // 출력용 레이블
    var txtUpdate: UILabel! // 스위치 컨트롤의 값을 표현할 레이블
    var txtInterval: UILabel! // 스테퍼 컨트롤의 값을 표현할 레이블
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 네비게이션 바 이름 설정
        self.navigationItem.title = "설정"
        //이메일 라벨 설정
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 50, y: 120, width: 100, height: 30)
        lblEmail.text = "이메일"
        lblEmail.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(lblEmail)
        
        // 이메일 입력 텍스트 필드를 추가.
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 120, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13) // 1
        self.paramEmail.borderStyle = UITextField.BorderStyle.roundedRect //2
        self.paramEmail.autocapitalizationType = .none // <--대문자 자동 변환 기능을 해제하는 구문
        self.view.addSubview(self.paramEmail)

        //자동갱신 레이블
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 50, y: 200, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(lblUpdate)
        
        //자동갱신 스위치 객체 생성
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)
        self.view.addSubview(self.paramUpdate)
        
        // 스위치 객체의 값을 표현할 레이블을 추가
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red // 1. 텍스트의 색상 설정
        self.txtUpdate.text = "갱신함" // 2. "갱신함" or "갱신하지 않음"
        
        //갱신주기 레이블
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 50, y: 280, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(lblInterval)
        
        //갱신주기 스테퍼 추가
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 280, width: 50, height: 30)
        self.paramInterval.minimumValue = 0 // 1. 스테퍼가 가질 수 있는 최솟값
        self.paramInterval.maximumValue = 100 // 2. 스테퍼가 가질 수 있는 최댓값
        self.paramInterval.stepValue = 1 // 3. 스테퍼의 값 변경 단위
        self.paramInterval.value = 0 // 4. 초깃값 설정
        self.view.addSubview(paramInterval)
        
        // 스테퍼의 값을 텍스트로 표현할 레이블을 추가
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 280, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        self.view.addSubview(self.txtInterval)
        
        // 스위치와 스테퍼 컨트롤의 Value Changed 이벤트를 각각 액션 메소드에 연결한다.
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        // 전송 버튼을 내비게이션 아이템에 추가하고, submit 메소드에 연결
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
    }
    
    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" :  "갱신하지 않음")
    }
    
    @objc func presentIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = ("\(Int(sender.value) )분마다")
    }
    
    @objc func submit(_ sender: Any) {
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

