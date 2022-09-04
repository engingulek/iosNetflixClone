//
//  CollectionViewTableViewCell.swift
//  NetflixClone
//
//  Created by engin gülek on 4.09.2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifer = "CollectionTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
   
    
}
