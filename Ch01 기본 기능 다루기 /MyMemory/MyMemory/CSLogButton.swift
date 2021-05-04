//
//  CSLogButton.swift
//  MyMemory
//
//  Created by 유저 on 2021/05/04.
//

import UIKit
public enum CSLogType:Int{
    case basic // 기본 로그 타입
    case title // 버튼의 타이틀 ㅜㄹ력
    case tag // 버튼 태그값 출력
}

class CSLogButton: UIButton {
    public var logType: CSLogType = .basic
    

}
