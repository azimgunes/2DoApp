//
//  ViewController.swift
//  2DoApp
//
//  Created by Azim Güneş on 11.02.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var models = [TodoListItems]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "2Do App"
        view.addSubview(tableView)
        getAllItems()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.frame = view.bounds
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
    
    
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        didTapForAdd()
    }
    
    @objc func didTapForAdd(){
        let alert = UIAlertController(title: "New Goal", message: "Write New Goal", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "OKEY", style: UIAlertAction.Style.default, handler: { [weak self]_ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                let newalert = UIAlertController(title: "There is no something.", message: "Don't forget your goals.", preferredStyle: UIAlertController.Style.alert)
                newalert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
                self?.present(newalert, animated: true, completion: nil)
                return
            }
            self?.createItem(name: text)
            
        }))
        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.destructive, handler: { _ in
            self.dismiss(animated: true)
        }))

        present(alert, animated: true, completion: nil)

    }
    
    @objc func getAllItems (){
        models = try! context.fetch(TodoListItems.fetchRequest())
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }

    
    @objc func createItem(name: String){
        let newItem = TodoListItems(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        try? context.save()
        
        getAllItems()
    }
    
    @objc func deleteItem(item: TodoListItems){
        context.delete(item)
        getAllItems()
        try? context.save()
    }
    
    @objc func updateItem(item: TodoListItems, newName: String) {
        item.name = newName
        getAllItems()
        try? context.save()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: [indexPath.row])
        cell.textLabel?.text = model.name
        cell.textLabel?.textColor = .white
        cell.contentView.backgroundColor = .systemOrange

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = models[indexPath.row]
        
        let edit = UIAlertController(title: "Edit Goal", message: "What's the change?", preferredStyle: UIAlertController.Style.alert)
        edit.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil))
        edit.addAction(UIAlertAction(title: "EDIT", style: UIAlertAction.Style.default, handler: { _ in
            let alert = UIAlertController(title: "New Goal", message: "Write New Goal", preferredStyle: UIAlertController.Style.alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.name
            alert.addAction(UIAlertAction(title: "Save", style: UIAlertAction.Style.cancel, handler: { [weak self]_ in
                guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
                    return
                }
                self?.updateItem(item: item, newName: newName)
                
            }))
            self.present(alert, animated: true)
        }))
        edit.addAction(UIAlertAction(title: "DELETE", style: UIAlertAction.Style.destructive, handler: { [weak self] _ in
            self?.deleteItem(item: item)
        }))

        present(edit, animated: true)
    }
  
    
}

