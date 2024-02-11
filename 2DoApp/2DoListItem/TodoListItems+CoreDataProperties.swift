//
//  TodoListItems+CoreDataProperties.swift
//  2DoApp
//
//  Created by Azim Güneş on 11.02.2024.
//
//

import Foundation
import CoreData


extension TodoListItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoListItems> {
        return NSFetchRequest<TodoListItems>(entityName: "TodoListItems")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension TodoListItems : Identifiable {

}
