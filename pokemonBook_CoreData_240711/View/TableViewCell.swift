//
//  TableViewCell.swift
//  pokemonBook_CoreData_240711
//
//  Created by 김솔비 on 7/16/24.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    let imgView = {
        let imgVw = UIImageView()
        imgVw.layer.cornerRadius = 30
        imgVw.layer.borderWidth = 2
        imgVw.clipsToBounds = true // 모서리가 둥글게 잘리도록 설정
        imgVw.layer.borderColor = UIColor.lightGray.cgColor
        return imgVw
    }()
    
    let nameLabel = {
        let nameLb = UILabel()
        nameLb.textAlignment = .center
        nameLb.textColor = .black
        nameLb.backgroundColor = .white
        nameLb.text = "김동남"
        nameLb.font = UIFont.systemFont(ofSize: 15)
        return nameLb
    }()
    
    let numberLabel = {
        let numLb = UILabel()
        numLb.textAlignment = .left
        numLb.textColor = .black
        numLb.backgroundColor = .white
        numLb.text = "010-0000-0000"
        numLb.font = UIFont.systemFont(ofSize: 15)
        return numLb
    }()
    
    //셀 초기화 시 호출되는 메서드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("*T_T*")
    }
    
    private func configureUI() {
        [imgView, nameLabel, numberLabel].forEach {
            contentView.addSubview($0)
        } //contentView: 테이블뷰 컨텐츠 추가 관리하는 속성의 뷰
        
        imgView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(60) //사이즈 제약 조건 추가
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(imgView.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
        }
        
        numberLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
        }
        
        
    }
}
