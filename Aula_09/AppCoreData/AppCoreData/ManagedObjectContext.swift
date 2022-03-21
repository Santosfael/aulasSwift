//
//  ManageObjectContext.swift
//  AppCoreData
//
//  Created by Idwall Go Dev 008 on 17/03/22.
//

import Foundation
import UIKit
import CoreData

typealias onCompletionHandler = (String) -> Void

protocol managedProtocol {
    func getPersons() -> [Person]
}

protocol managedSavedProtocol {
    func save(person: Person, onCompletionHandler: onCompletionHandler)
}

protocol managedDeleteProtocol {
    func delete(uuid: String, onCompletionHandler: onCompletionHandler)
}


class ManagedOBjectContext: managedProtocol,
                            managedSavedProtocol,
                            managedDeleteProtocol {
    private let entity = "Users"
    
    //Padrão singonto, pois não precisa instanciar na view Controller
    static var shared: ManagedOBjectContext = {
        let instance = ManagedOBjectContext()
        return instance
    }()
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    func save(person: Person, onCompletionHandler: onCompletionHandler) {
        //fazer um classe e passar por parametro de criação - Colocar isso no meu app
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else { return }
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        transaction.setValue(person.id, forKey: "id")
        transaction.setValue(person.name, forKey: "name")
        transaction.setValue(person.lastName, forKey: "lastName")
        transaction.setValue(person.age, forKey: "age")
        
        do {
            try context.save()
            onCompletionHandler("Save success")
            
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    func getPersons() -> [Person] {
        var listPerson: [Person] = []
        
        //conectando a entidade
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        do {
            //pegando o meu contexto e dando um fetch e para não retornar any foi criado um cast do tipo NSManagedObject
            guard let persons = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return listPerson }
            for item in persons {
                //Mapeando a entidade, como é um getAll, tras todos os users do banco
                if let id = item.value(forKey: "id") as? UUID,
                    let name = item.value(forKey: "name") as? String,
                    let lastName = item.value(forKey: "lastName") as? String,
                    let age = item.value(forKey: "age") as? Int {
                    
                        let person = Person(id: id, name: name, lastName: lastName, age: age)
                        
                        //adicionando na lista
                        listPerson.append(person)
                }
            }
            //listPerson = persons
        } catch let error as NSError {
            print("Request Error: \(error.localizedDescription)")
        }
        
        //Populada ou vazia
        return listPerson
    }
    
    func delete(uuid: String, onCompletionHandler: onCompletionHandler) {
        let context = getContext()
        let predicate = NSPredicate(format: "id == %@", "\(uuid)")
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        fetchRequest.predicate = predicate
        
        do {
            let fetchResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            if let entityDelete = fetchResults.first {
                context.delete(entityDelete)
            }
            
            try context.save()
            onCompletionHandler("Delete success")
        } catch let error as NSError {
            print("Fetch failed \(error.localizedDescription)")
        }
    }
    
}
