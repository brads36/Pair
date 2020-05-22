//
//  CoreDataStack.swift
//  Pair
//
//  Created by Bryce Bradshaw on 5/22/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        // TODO: Remember to change name of container
        let container = NSPersistentContainer(name: "Pair")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved Error \(error), \(error.userInfo)") // calling fatalError causes the app to crash
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext}
}

