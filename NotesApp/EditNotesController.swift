//
//  ViewController.swift
//  NotesApp
//
//  Created by Yogiraj Thombre on 8/18/23.
//

import UIKit

class EditNotesController: UIViewController {
    
    var notesModel = [Note]()
    
    var notesTitle : UITextField = {
            let title = UITextField()
            title.translatesAutoresizingMaskIntoConstraints = false
            title.borderStyle = .roundedRect
            title.font = UIFont(name: "GillSans", size: 24)
            title.backgroundColor = .white
            title.attributedPlaceholder = NSAttributedString(string: "Add Notes Title Here ....", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black])
            title.textColor = .black
            return title
    }()
    
    var notesContent : UITextField = {
            let title = UITextField()
            title.translatesAutoresizingMaskIntoConstraints = false
            title.borderStyle = .roundedRect
            title.font = UIFont(name: "GillSans", size: 24)
            title.textAlignment = .left
            title.contentVerticalAlignment = .top
            title.backgroundColor = .white
            title.attributedPlaceholder = NSAttributedString(string: "Add Content Here ....", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black])
            title.textColor = .black
            return title
    }()
    
    var saveButton : UIButton = {
            let button = UIButton(type: .roundedRect)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Save", for: .normal)
            button.layer.cornerRadius = 10
            button.layer.shadowRadius = 10
            button.titleLabel?.textColor = UIColor.white
            button.titleLabel?.font = UIFont(name: "GillSans", size: 24)
            button.backgroundColor = .black
            button.addTarget(self, action: #selector(saveNotes), for: .touchUpInside)
            return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        addSubView()
        constraintsInit()
    }
    
    func constraintsInit(){
        
        notesTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
        notesTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -30).isActive = true
        notesTitle.topAnchor.constraint(equalTo: view.topAnchor,constant: 120).isActive = true
        notesTitle.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        notesContent.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
        notesContent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -30).isActive = true
        notesContent.topAnchor.constraint(equalTo: notesTitle.bottomAnchor,constant: 30).isActive = true
        notesContent.heightAnchor.constraint(equalToConstant: 380).isActive = true
        
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 100).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -100).isActive = true
        saveButton.topAnchor.constraint(equalTo: notesContent.bottomAnchor,constant: 30).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func addSubView(){
        view.addSubview(notesTitle)
        view.addSubview(notesContent)
        view.addSubview(saveButton)
    }
    
    @objc func saveNotes(_sender : UIButton?){
        print("The note is saved successfully ....")
        let managedContext = AppDelegate.coreDataStack.managedContext
        let newNote = Note(context: managedContext)
        newNote.setValue(Date(), forKey: "editDate")
        newNote.setValue(notesContent.text, forKey: "noteText")
        newNote.setValue(notesTitle.text, forKey: "noteTitle")
    }

}

