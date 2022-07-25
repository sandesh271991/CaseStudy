//
//  Persistence.swift
//  TestCase
//
//  Created by 1923800 on 25/07/22.
//

import CoreData

struct PersistenceManager {
    static let shared = PersistenceManager()

    static var preview: PersistenceManager = {
        let result = PersistenceManager(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.title = String()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TestCase")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }


    func saveResult(title: String) {
        let result =  Item(context: container.viewContext)
        result.title = title

        do {
            try container.viewContext.save()
        }
        catch {
            // TODO: handle the error
            print("error")
        }
    }

    func getResult() -> [Item] {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()

        do {
           return try container.viewContext.fetch(fetchRequest)
        }
        catch {
            return []
        }
    }

    func deleteOldResult() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Item")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try container.viewContext.execute(deleteRequest)
        } catch let error as NSError {
            // TODO: handle the error
            print("error")
        }
    }
}
