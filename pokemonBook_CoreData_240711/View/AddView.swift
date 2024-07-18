//
//  AddView.swift
//  pokemonBook_CoreData_240711
//
//  Created by 김솔비 on 7/16/24.
//

import UIKit
import SnapKit
import Kingfisher //API에 있는 이미지만 가져오기

class AddView: UIView, UITextViewDelegate {
  
  lazy var profileImage = {
    let pI = UIImageView()
    pI.layer.cornerRadius = 100
    pI.layer.borderWidth = 2
    pI.layer.borderColor = UIColor.systemGray4.cgColor
    pI.clipsToBounds = true
    pI.contentMode = .scaleAspectFill // 이미지 비율 유지하며 채우기
    return pI
  }()
  
  lazy var randomButton = {
    let rB = UIButton()
    rB.backgroundColor = .white
    rB.setTitleColor(.darkGray, for: .normal)
    rB.setTitleColor(.systemPink, for: .highlighted)
    rB.setTitle("랜덤 이미지 생성", for: .normal)
    rB.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    return rB
  }()
  
  public lazy var inputName = {
    let ipName = UITextView()
    ipName.delegate = self //Placeholder 메서드 자동호출
    ipName.layer.cornerRadius = 10
    ipName.layer.borderWidth = 1
    ipName.layer.borderColor = UIColor.lightGray.cgColor
    ipName.font = .systemFont(ofSize: 15)
    ipName.textAlignment = .center
    ipName.textColor = .darkGray
    ipName.textColor = .systemGray4 //Placeholder 색상
    ipName.text = "이름을 입력하세요" //Placeholder 텍스트
    ipName.tag = 1
    return ipName
  }()
  
  public lazy var inputNum = {
    let ipNum = UITextView()
    ipNum.delegate = self //Placeholder 메서드 자동호출
    ipNum.layer.cornerRadius = 10
    ipNum.layer.borderWidth = 1
    ipNum.layer.borderColor = UIColor.lightGray.cgColor
    ipNum.font = .systemFont(ofSize: 15)
    ipNum.textAlignment = .center
    ipNum.textColor = .darkGray
    ipNum.textColor = .systemGray4 //Placeholder 색상
    ipNum.text = "전화번호를 입력하세요" //Placeholder 텍스트
    ipNum.tag = 2
    return ipNum
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("*T_T*")
  }
  
  private func configureUI() {
    
    [profileImage, randomButton, inputName, inputNum].forEach {
      self.addSubview($0)
    }
    
    profileImage.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide).offset(30)
      $0.centerX.equalToSuperview()
      $0.size.equalTo(CGSize(width: 200, height: 200))
    }
    
    randomButton.snp.makeConstraints {
      $0.top.equalTo(profileImage.snp.bottom).offset(20)
      $0.centerX.equalToSuperview()
      $0.size.equalTo(CGSize(width: 100, height: 20))
    }
    
    inputName.snp.makeConstraints {
      $0.top.equalTo(randomButton.snp.bottom).offset(40)
      $0.centerX.equalToSuperview()
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
      //      $0.bottom.equalToSuperview()
      $0.size.equalTo(CGSize(width: 200, height: 40))
    }
    
    inputNum.snp.makeConstraints {
      $0.top.equalTo(inputName.snp.bottom).offset(20)
      $0.centerX.equalToSuperview()
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
      $0.size.equalTo(CGSize(width: 200, height: 40))
    }
  }
  
  //UITextViewDelegate 메서드들 추가
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == .systemGray4 {
      textView.text = nil
      textView.textColor = .darkGray
    }
  }
  //텍스트 지워지면 다시 기본 메세지 뜨게 설정함
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      if textView.tag == 1 {
        textView.text = "이름을 입력하세요"
        textView.textColor = .systemGray4
      } else if textView.tag == 2 {
        textView.text = "전화번호를 입력하세요"
        textView.textColor = .systemGray4
      }
    }
  }
}

