//
//  Members.swift
//  Pair
//
//  Created by Bryce Bradshaw on 5/22/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import Foundation
import CoreData

extension Members {
    
    convenience init(members: [String], context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.members = members as NSObject
    }
}
