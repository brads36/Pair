//
//  MembersController.swift
//  Pair
//
//  Created by Bryce Bradshaw on 5/22/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import Foundation
import CoreData

class MemberController {
    
    // MARK: - Singleton
    static let shared = MemberController()
    
    // MARK: - Source of Truth
    var members: [Member] {
        let moc = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
        let fetchResults = try? moc.fetch(fetchRequest)
        return fetchResults ?? []
    }
    
    // MARK: - CRUD
    func addMember(_ name: String) {
        let member = Member(name)
        saveToPersistence()
    }
    
    func deleteMember(_ member: Member) {
        if let moc = member.managedObjectContext {
            moc.delete(member)
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
