//
//  AllNotes.swift
//  NotesApp
//
//  Created by Yogiraj Thombre on 8/19/23.
//

import Foundation
import UIKit

class AllNotesController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedNotes.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomTableViewCell
        cell.backgroundColor = UIColor.white
        cell.dayLabel.text = "Day \(indexPath.row+1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(EditNotesController(), animated: true, completion: nil)
    }
    
    
    lazy var savedNotes : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.separatorColor = .black
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        savedNotes.delegate = self
        savedNotes.dataSource = self
        setupTableView()
    }
    
    func setupTableView() {
        
        savedNotes.register(CustomTableViewCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(savedNotes)
        
        NSLayoutConstraint.activate([
            savedNotes.topAnchor.constraint(equalTo: self.view.topAnchor),
            savedNotes.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            savedNotes.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            savedNotes.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        
    }
    
}
