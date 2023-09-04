//
//  ViewController.swift
//  NotesApp
//
//  Created by Yogiraj Thombre on 8/18/23.
//

import UIKit
import KMPlaceholderTextView

class EditNotesController: UIViewController {
    
    var notesModel = [Note]()
    
    var notesTitle : KMPlaceholderTextView = {
            let title = KMPlaceholderTextView()
            title.translatesAutoresizingMaskIntoConstraints = false
            title.font = UIFont(name: "GillSans", size: 34)
            title.layer.cornerRadius = 10
            title.layer.borderWidth = 1.0
            title.layer.borderColor = UIColor.lightGray.cgColor
            title.placeholder = "Title . . ."
            title.clipsToBounds = true
            title.textColor = .black
            title.backgroundColor = .white
            title.isScrollEnabled = false
            title.textContainerInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
            return title
    }()
    
    var notesContent : KMPlaceholderTextView = {
        let content = KMPlaceholderTextView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.font = UIFont(name: "GillSans", size: 26)
        content.layer.cornerRadius = 10
        content.clipsToBounds = true
        content.textColor = .black
        content.placeholder = "Note"
        content.backgroundColor = .white
        content.isScrollEnabled = false
        return content
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubView()
        constraintsInit()
    }
    
    func constraintsInit(){
        
        notesTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        notesTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20).isActive = true
        notesTitle.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        
        notesContent.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        notesContent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20).isActive = true
        notesContent.topAnchor.constraint(equalTo: notesTitle.bottomAnchor,constant: 30).isActive = true
    }
    
    func addSubView(){
        view.addSubview(notesTitle)
        view.addSubview(notesContent)
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

