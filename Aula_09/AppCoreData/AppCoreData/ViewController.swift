//
//  ViewController.swift
//  AppCoreData
//
//  Created by Idwall Go Dev 008 on 17/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func save() {
        let person = Person(id: UUID(), name: "Rafael", lastName: "Rocha dos Santos", age: 29)
        ManagedOBjectContext.shared.save(person: person) { result in
            print(result)
        }
    }
    
    @IBAction func delete() {
        let id = "951D9A7B-80BF-41FC-AD45-38442821F022"
        ManagedOBjectContext.shared.delete(uuid: id) { Result in
            print("Delete success")
        }
    }
    
    @IBAction func getPerson() {
        let person = ManagedOBjectContext.shared.getPersons()
        print(person)
    }
}

