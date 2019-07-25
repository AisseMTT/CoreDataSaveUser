//
//  ViewController.swift
//  SavingUserData
//
//  Created by Aisse Melissa Torres Torres on 7/24/19.
//  Copyright © 2019 Microsoft. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do{
            let people = try PersistenceServce.context.fetch(fetchRequest)
            self.people = people
            self.tableView.reloadData()
        } catch {}
        
    }
    

    
    @IBAction func onPlusTapp() {
        let alert = UIAlertController(title: "add person", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "age"
            textField.keyboardType = .numberPad
        }
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let name = alert.textFields!.first!.text!
            let age = alert.textFields!.last!.text!
            let person = Person(context: PersistenceServce.context)
            person.name = name
            person.age = Int16(age)!
            PersistenceServce.saveContext()
            self.people.append(person)
            self.tableView.reloadData()
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = people[indexPath.row].name
        cell.detailTextLabel?.text = String(people[indexPath.row].age)
        return cell
    }
    
}

