//
//  MembersController.swift
//  Pair
//
//  Created by Bryce Bradshaw on 5/22/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import Foundation
import CoreData

class MembersController {
    
    // MARK: - Singleton
    static let shared = MembersController()
    
    // MARK: - Source of Truth
    var members: [String] {
        
        let moc = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Members> = Members.fetchRequest()
        let fetchResults = try? moc.fetch(fetchRequest)
        var membersNames: [String] = []
        if let fetchResults = fetchResults {
            for member in fetchResults {
                let name = member as! String
                membersNames.append(name)
            }
        } else { return [] }
        return membersNames
    }
    
    // MARK: - CRUD
    func addMember(_ name: String) {
        
    }
    
    func deleteMember(_ name: String) {
        
    }
    
    func saveToPersistence() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let error {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
