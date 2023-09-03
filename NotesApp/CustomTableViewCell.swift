//
//  CustomTableViewCell.swift
//  NotesApp
//
//  Created by Yogiraj Thombre on 8/19/23.
//

import Foundation
import UIKit

class CustomTableViewCell : UITableViewCell {
    
    let cellView: UIView = {
           let view = UIView()
           view.backgroundColor = UIColor.red
           view.layer.cornerRadius = 20
           view.layer.shadowColor = UIColor.red.cgColor
           view.layer.shadowOpacity = 1
           view.layer.shadowOffset = CGSize(width: 5, height: 5)
           view.layer.shadowRadius = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
    }()
       
    let dayLabel: UILabel = {
           let label = UILabel()
           label.textColor = UIColor.white
           label.font = UIFont(name: "GillSans-Bold", size: 32)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(cellView)
        
        addSubview(dayLabel)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -20),
            dayLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 50),
            dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor,constant: 20),
        ])
        
    }
    
}
