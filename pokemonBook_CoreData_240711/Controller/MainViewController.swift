//
//  ViewController.swift
//  pokemonBook_CoreData_240711
//
//  Created by 김솔비 on 7/11/24.
//

import UIKit
import CoreData
import SnapKit
import Kingfisher


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var container: NSPersistentContainer!
  let tableView = UITableView()
  var phoneBookList: [PhoneBook]  = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //appDelegate가 AppDelegate에 접근할 수 있도록 타입캐스팅
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    self.container = appDelegate.persistentContainer
    
    tableView.delegate = self
    tableView.dataSource = self
    
    //테이블뷰 셀을 재사용 할 수 있게 만들어주는 코드
    tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    tableView.rowHeight = 80
    tableView.separatorInset.left = 0
    
    view.backgroundColor = .white
    self.title = "친구 목록"
    
    //네비게이션바 오른쪽 버튼 아이템 설정(연락처 추가 페이지로 넘어가기)
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(navigationButton))
    
    setUpTableView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    readAllData()
  }
  
  private func setUpTableView() {
    view.addSubview(tableView)
    
    //테이블뷰 오토레이아웃 설정
    tableView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
      $0.leading.trailing.bottom.equalToSuperview().inset(20)
    }
  }
  
  //테이블뷰 셀 개수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return phoneBookList.count
  }
  
  //테이블뷰 셀이 필요할 때마다 해당 메서드를 호출한다(셀이 없다면 새로운 셀을 생성한다)
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //기본제공되는 cell을 TableViewCell로 변경해줌
    //tableView.register 갖다씀
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
      return UITableViewCell()
    }
    cell.nameLabel.text = phoneBookList[indexPath.item].name
    cell.numberLabel.text = phoneBookList[indexPath.item].phoneNumber
    cell.imgView.kf.setImage(with: URL(string: phoneBookList[indexPath.item].profileImage!))
    return cell
  }
  
  //네비게이션바 버튼 메서드
  @objc func navigationButton() {
    let pressedButton = AddViewController()
    self.navigationController?.pushViewController(pressedButton, animated: true)
  }
  
  //coreData에서 Data Read 및 메인컨트롤러 업데이트
  func readAllData() {
    do {
      phoneBookList = try self.container.viewContext.fetch(PhoneBook.fetchRequest())
    } catch {
      print("데이터 읽기 실패")
    }
    tableView.reloadData()
  }
}

