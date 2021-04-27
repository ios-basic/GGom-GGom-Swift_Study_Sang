//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by 유저 on 2021/04/26.
//

import UIKit

class MemoReadVC: UIViewController {
    //콘텐츠 변수 저장
    var param : MemoData?
    
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //제목 내용 이미지 출력
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        // 날짜 포맷 변환
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dataString = formatter.string(from: (param?.regdate)!)
        // 네비게이션 타이틀에 표시
        self.navigationItem.title = dataString
    }

}
