//
//  DataController.swift
//  Recast
//
//  Created by Mindy Lou on 9/19/18.
//  Copyright © 2018 Cornell AppDev. All rights reserved.
//

import Foundation
import CoreData

class DataController: NSObject {

    // MARK: Data variables
    lazy var managedObjectContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

    /// Child managed object context, accessible across queues
    /// Saving to this context will actually save
    lazy var childManagedObjectContext: NSManagedObjectContext = {
        let childMOC = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        childMOC.parent = managedObjectContext
        return childMOC
    }()

    var persistentContainer: NSPersistentContainer

    init(completion: @escaping () -> Void) {
        persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
            completion()
        }
        // Uncomment to print out which file directory the sqlite store is in
        print(persistentContainer.persistentStoreCoordinator.persistentStores.first?.url ?? "")
    }
}
