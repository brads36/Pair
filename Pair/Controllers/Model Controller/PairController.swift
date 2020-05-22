//
//  PairController.swift
//  Pair
//
//  Created by Bryce Bradshaw on 5/22/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import Foundation
import CoreData

class PairController {
    
    // MARK: - Sigleton
    static let shared = PairController()
    
    // MARK: - Sources of truth
    var pairs: [Pair] {
        let moc = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Pair> = Pair.fetchRequest()
        let fetchResults = try? moc.fetch(fetchRequest)
        return fetchResults ?? []
    }
    
    // MARK: - CRUD
    func createPair(pairID: Int, firstMember: Member, secondMember: Member?) {
                
        saveToPersistence()
    }
    
    func DeletePair(_ pair: Pair) {
        if let moc = pair.managedObjectContext {
            moc.delete(pair)
            saveToPersistence()
        }
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
