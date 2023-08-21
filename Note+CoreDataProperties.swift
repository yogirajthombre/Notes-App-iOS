//
//  Note+CoreDataProperties.swift
//  NotesApp
//
//  Created by Yogiraj Thombre on 8/21/23.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var noteTitle: String?
    @NSManaged public var noteText: String?
    @NSManaged public var editDate: String?

}

extension Note : Identifiable {

}
