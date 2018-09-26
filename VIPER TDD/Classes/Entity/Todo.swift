//
//  Todo.swift
//  VIPER TDD
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation
import CoreData

enum TodoKey: String {
    case title
    case completed
    case id
}

extension Todo: Entity {
    static func entityName() -> String {
        return "Todo"
    }

    static func create(withData data: [String : Any]?,
                       context: NSManagedObjectContext) -> Entity? {
        guard let todo = NSEntityDescription.insertNewObject(forEntityName: Todo.entityName(),
                                                             into: context) as? Todo else {
            return nil
        }

        if let data = data {
            todo.update(withData: data)
        }

        return todo
    }
    
    func update(withData data: [String: Any]) {
        for (_, keyValue) in data.enumerated() {
            guard let key = TodoKey(rawValue: keyValue.key) else {
                continue
            }

            switch key {
            case .id:
                guard let value = keyValue.value as? String else { continue }
                self.id = value
            case .title:
                guard let value = keyValue.value as? String else { continue }
                self.title = value
            case .completed:
                guard let value = keyValue.value as? Bool else { continue }
                self.completed = value
            }
        }
    }
}
