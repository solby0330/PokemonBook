//
//  View.swift
//  pokemonBook_CoreData_240711
//
//  Created by 김솔비 on 7/16/24.
//

import UIKit
import SnapKit

Class CustomTableViewCell: UITableViewCell {
    
        private let imgView = UIImageView()
    
        private let nameLabel = {
            let nameLb = UILabel()
            nameLb.textAlignment = .center
            nameLb.textColor = .black
            nameLb.backgroundColor = .white
            nameLb.text = "김동남"
            nameLb.font = UIFont.systemFont(ofSize: 15)
            return nameLb
        }
    
        private let numberLabel = {
            let numLb = UILabel()
            numLb.textAlignment = .left
            numLb.textColor = .black
            numLb.backgroundColor = .white
            numLb.text = "010-0000-0000"
            numLb.font = UIFont.systemFont(ofSize: 15)
            return numLb
        }
}
