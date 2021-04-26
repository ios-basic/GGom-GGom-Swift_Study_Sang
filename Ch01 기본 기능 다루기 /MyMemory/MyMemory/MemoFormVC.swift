//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by 유저 on 2021/04/26.
//

import UIKit


// 두 delegate 프로토콜 추가한 이유는 카메라 촬영 or 저장된 이미지 가져오기 위함 - 모두 델리게이트 패턴으로 작용함
class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    var subject: String!
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    
    override func viewDidLoad() {
        self.contents.delegate = self
        super.viewDidLoad()
        
    }
    // 텍스트뷰의 내용이 변결될 때마다 호출되는 델리게이트 메소드
    func textViewDidChange(_ textView: UITextView) {
        // 내용 15자리를 읽어서 제목으로 추출하는 방법
        let contents = textView.text as NSString
        let length = ((contents.length) > 15) ? 15 : contents.length // 내용 길이가 15보다 크면 15자리까지만 저장 아니면 전체 길이 저장!
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        //네비게이션 타이틀에 표시
        self.navigationItem.title = subject
    }
    
    @IBAction func save(_ sender: Any) {
        //1. 내용 입력 없을 경우 경고!
        guard self.contents.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil , message: "내용을 입력하쇼!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        //2. MemoData 객체 생성하고 데이터 담는다.
        let data = MemoData()
        
        data.title = self.subject //제목
        data.contents = self.contents.text // 내용
//        data.image = self.preview.image //이미지
        data.regdate = Date() // 작성 시각
        
        //3. 앱 델리게이트 객체 읽어서 memolist배열에 memodata객체 추가
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        //4. 작성폼 화면 종료, 이전화면으로 돌아가기
        _ = self.navigationController?.popViewController(animated: true)
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // self.preview.image = info[UIImagePickerControllerEditedImage] 책에선 왼쪽같이 나와있는데 버젼업데이트 이후 아래처럼 바뀜
        self.preview.image = info[.editedImage] as? UIImage
        // 미리보기 표시
        
        picker.dismiss(animated: false)
    }
}
