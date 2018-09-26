//
//  AddTodoInteractorIO.swift
//  VIPER TDD
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation

protocol AddTodoInteractorInput: class {
    func addTodo(withData data: [String: Any])
}

protocol AddTodoInteractorOutput: class {
    func addTodoSuccess(todo: Todo)

    func addTodoFailed(withMessage message: String)
}
