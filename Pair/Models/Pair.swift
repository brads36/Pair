//
//  Pair.swift
//  Pair
//
//  Created by Bryce Bradshaw on 5/22/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import Foundation
import CoreData

extension Pair {
    
    convenience init(pairID: Int, memberOne: String, memberTwo: String = "", context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.pairID = Int64(pairID)
        self.memberOne = memberOne
        self.memberTwo = memberTwo
    }
}
