//
//  MockAddTodoInteractorOutput.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation
@testable import VIPER_TDD

class MockAddTodoInteractorOutput: AddTodoInteractorOutput {
    private(set) var todo: Todo?
    private(set) var message: String?
    private(set) var addTodoSuccessCalled = 0
    private(set) var addTodoFailedCalled = 0

    func addTodoSuccess(todo: Todo) {
        self.todo = todo
        self.addTodoSuccessCalled += 1
    }

    func addTodoFailed(withMessage message: String) {
        self.message = message
        self.addTodoFailedCalled += 1
    }
}
