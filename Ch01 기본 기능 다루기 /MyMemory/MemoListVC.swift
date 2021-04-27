//
//  TableViewController.swift
//  MyMemory
//
//  Created by 유저 on 2021/04/26.
//

import UIKit

class MemoListVC: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//     화면이 나타날 때마다 호출
//    1. 다른 화면으로 이동했다가 다시 돌아올 때
//    2. 홈버튼을 눌러 앱이 백그라운드 모드로 내려갔다가 재활성화 될 떄
//    3. 기타 상황으로 뷰 컨트롤러가 스크린에 표시될 떄???
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    // 테이블 행 개수 결정
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memolist.count
        return count
    }
    //테이브 행 구성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. memolist 배열 데이터에서 주어진 행에 맞는 데이터 꺼내기
        let row = self.appDelegate.memolist[indexPath.row]
        //2. 이미지 속성이 비어있으면 "memoCell" 아니면 "memoCellWithImage"
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        //3. 재사용 큐로부터 프로토타입 셀의 인스턴스 전달
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        //4. memoCell 내용 구성
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        //5. date 타입의 날짜를 yyyy-mm-dd에 포맷에 맞게 변경
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate?.text = formatter.string(from: row.regdate!)
        
        return cell
        }
    // 테이블의 특정 행이 선택됐을 때 호출 + 선택된 행의 정보는 indexpath에 담겨 전달!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //memolist배열엣 선택된 행에 맞는 데이터 꺼내기
        let row = self.appDelegate.memolist[indexPath.row]
        //상세 화면 인스턴스 생성
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else{
            return
        }
        // 값 전달 후 상세화면으로 이동
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
   



}
