//
//  ViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 11.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @objc func getAllItems (){
        let items = try? context.fetch(TodoListItems.fetchRequest())
        
    }

    
    @objc func createItem(name: String){
        let newItem = TodoListItems(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        try? context.save()
    }
    
    @objc func deleteItem(item: TodoListItems){
        context.delete(item)
        
        try? context.save()
    }
    
    @objc func updateItem(item: TodoListItems, newName: String) {
        item.name = newName
        
        try? context.save()
        
    }
}

