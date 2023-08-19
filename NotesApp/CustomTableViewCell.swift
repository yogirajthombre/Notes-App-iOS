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
           view.layer.cornerRadius = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
    }()
       
    let dayLabel: UILabel = {
           let label = UILabel()
           label.textColor = UIColor.white
           label.font = UIFont.boldSystemFont(ofSize: 24)
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
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.heightAnchor.constraint(equalToConstant: 200),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant:3),
            dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10),
            dayLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor,constant: 3)
        ])
        
    }
    
}
