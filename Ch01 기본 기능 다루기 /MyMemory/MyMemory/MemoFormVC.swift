//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by 유저 on 2021/04/26.
//

import UIKit
// 두 delegate 프로토콜 추가한 이유는 카메라 촬영 or 저장된 이미지 가져오기 위함 - 모두 델리게이트 패턴으로 작용함
class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var subject: String!
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    @IBAction func save(_ sender: Any) {
    }
    
    @IBAction func pick(_ sender: Any) {
        //이미지 피커 객체 생성
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        // 이미지 편집 속성 false면 편집과정 사라짐 사진크기조절 안함
        
        // 이미지 피커 화면 표시
        self.present(picker, animated: false)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.preview.image = info[UIImagePi]
    }
}
