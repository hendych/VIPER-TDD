//
//  MockAddTodoInteractorInput.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation
@testable import VIPER_TDD

class MockAddTodoInteractorInput: AddTodoInteractorInput {
    private(set) var data: [String: Any]?
    private(set) var addTodoCalled = 0

    func addTodo(withData data: [String: Any]) {
        self.data = data
        self.addTodoCalled += 1
    }
}
