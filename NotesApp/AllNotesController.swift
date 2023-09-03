import Foundation
import UIKit
import CoreData

class AllNotesController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedNotes.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.dayLabel.text = "Day \(indexPath.row+1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fetchNotes()
        navigateToNextScreen()
    }
    
    @objc func navigateToNextScreen(){
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
        savedNotes.delegate = self
        savedNotes.dataSource = self
        title = "My Notes"
        let font = UIFont(name: "GillSans-Bold", size: 30)
        let attributes = [NSAttributedString.Key.font: font!]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateToNextScreen))
        rightBarButton.width = 40
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationController?.isNavigationBarHidden = false
        setupTableView()
    }
    
    func setupTableView() {
        
        savedNotes.register(CustomTableViewCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(savedNotes)
        
        NSLayoutConstraint.activate([
            savedNotes.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            savedNotes.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            savedNotes.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            savedNotes.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        
    }
    
    func fetchNotes(){
        let noteFetch : NSFetchRequest<Note> = Note.fetchRequest()
        do {
            let managedContext = AppDelegate.coreDataStack.managedContext
            let results = try managedContext.fetch(noteFetch)
            print(results)
        }catch let error as NSError {
            print("Fetch Error")
        }
    }
    
    func setNavigationBar(){
        print("Setting Navigation Bar . . .")
        let screenSize = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 100))
        navBar.backgroundColor = .orange
        let navItem = UINavigationItem()
        navBar.setItems([navItem], animated: false)
        view.addSubview(navBar)
    }
}
