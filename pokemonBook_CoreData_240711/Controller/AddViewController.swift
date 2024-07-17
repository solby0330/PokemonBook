//
//  AddViewController.swift
//  pokemonBook_CoreData_240711
//
//  Created by 김솔비 on 7/16/24.
//

import UIKit
import CoreData
import SnapKit

class AddViewController: UIViewController {
  //AppDelegate에서 생성한 NSPersistentContainer를 불러옴
  //Cannot find type 'NSPe~~ 오류 뜰 경우에는 import를 안 해준 것
  var container: NSPersistentContainer!
  let addView = AddView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //appDelegate가 AppDelegate에 접근할 수 있도록 타입캐스팅
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    self.container = appDelegate.persistentContainer
    
    //controller 기본 view를 addView의 view로 갈아낌
    self.view = addView
    self.title = "연락처 추가"
    
    view.backgroundColor = .white
    setUpnavigationBar()
  }
  
  //저장 버튼 네이게이션바 활성화
  func setUpnavigationBar() {
    let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveData))
    self.navigationItem.rightBarButtonItem = saveButton
  }
  
  //addView에서 입력받은 text를 Data에 저장
  @objc func saveData() {
    guard let name = addView.inputName.text, !name.isEmpty,
          let phoneNumber = addView.inputNum.text, !phoneNumber.isEmpty
            /*          let profileImage = addView.profileImage.image*/ else {
      print("텍스트를 입력해 주세요")
      return
    }
    navigationController?.popViewController(animated: true)
    //    let profileData = profileImage.jpegData(compressionQuality: 1.0)  //데이터 변환 코드
    creatData(name: name, phoneNumber: phoneNumber)
  }
  
//  @objc func buttonTapped() {
//    navigationController?.popViewController(animated: true)
//  }

  //coreData에 Data Create
  func creatData(name: String, phoneNumber: String/*, profileImage: Data*/) {
    guard let entity = NSEntityDescription.entity(forEntityName: PhoneBook.className, in: self.container.viewContext) else { return }
    let newPhoneBook = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
    newPhoneBook.setValue(name, forKey: PhoneBook.Key.name)
    newPhoneBook.setValue(phoneNumber, forKey: PhoneBook.Key.phoneNumber)
    //    newPhoneBook.setValue(profileData, forKey: PhoneBook.Key.profileImage)
    
    do {
      try self.container.viewContext.save()
      print("저장 성공")
    } catch {
      print("저장 실패")
    }
  }
  
  //coreData에서 Data Read
  func readAllData() {
    do {
      let phoneBook = try self.container.viewContext.fetch(PhoneBook.fetchRequest())
      
      for phoneBook in phoneBook as [NSManagedObject] {
        if let name = phoneBook.value(forKey: PhoneBook.Key.name) as? String,
           let phoneNumber = phoneBook.value(forKey: PhoneBook.Key.phoneNumber) as? String {
          print("name: \(name), phoneNumber: \(phoneNumber)")
        }
      }
    } catch {
      print("데이터 읽기 실패")
    }
  }
}

