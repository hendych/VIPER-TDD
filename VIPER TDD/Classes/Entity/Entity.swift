//
//  Entity.swift
//  VIPER TDD
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation
import CoreData

protocol EntityKey: Hashable {
}

protocol Entity {
    static func entityName() -> String

    static func create(withData data: [String: Any]?,
                       context: NSManagedObjectContext) -> Entity?
    
    func update(withData data: [String: Any])
}
