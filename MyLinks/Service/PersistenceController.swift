//
//  PersistenceController.swift
//  MyLinks
//
//  Created by Sai Balaji on 24/10/26.
//

import Foundation
import CoreData


class PersistenceController{
    let persistenceContainer: NSPersistentContainer
    
    init(inMemory: Bool = false ) {
        self.persistenceContainer = NSPersistentContainer(name: "Links")
        if inMemory{
            self.persistenceContainer.persistentStoreDescriptions.first?.url = URL(filePath: "/dev/null")
        }
        self.persistenceContainer.loadPersistentStores { _, error  in
            if let error{
                print(error)
            }
        }
    }
    
    func save()throws{
        let context = persistenceContainer.viewContext
        if context.hasChanges{
            try context.save()
        }
    }
    
    
    func fetchAllData<T: NSManagedObject>(entityName: String)throws -> [T]{
        let context = persistenceContainer.viewContext
        var fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "createdDate", ascending: true)]
        let allData: [T]  = try context.fetch(fetchRequest)
        return allData
    }
    
    func fetchAllData<T: NSManagedObject>(entityName: String,predicate: NSPredicate)throws -> [T]{
        let context = persistenceContainer.viewContext
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.predicate = predicate
        let allData: [T] = try context.fetch(fetchRequest)
        return allData
    }
    
    
}
