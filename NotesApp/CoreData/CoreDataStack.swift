//
//  CoreDataStack.swift
//  NotesApp
//
//  Created by Yogiraj Thombre on 8/21/23.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private let modelName : String
    
    init(modelName : String){
        self.modelName = modelName
    }
    
    private lazy var storeContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { success , error in
            if let error = error as NSError? {
                print("Un Resolved Error ...")
            }
        }
        return container
    }()
    
    lazy var managedContext : NSManagedObjectContext = self.storeContainer.viewContext
    
    func saveContext(){
        guard managedContext.hasChanges else {return}
        do {
            try managedContext.save()
        }catch _ as NSError {
            print("Error in saving the object .....")
        }
    }
    
}
