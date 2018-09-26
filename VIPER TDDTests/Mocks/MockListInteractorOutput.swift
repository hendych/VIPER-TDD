//
//  MockListInteractorOutput.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation
@testable import VIPER_TDD

class MockListInteractorOutput: ListInteractorOutput {
    private(set) var todoList: [Todo]?
    private(set) var getTodoListSuccessCalled = 0

    func getTodoListSuccess(todoList: [Todo]) {
        self.todoList = todoList
        self.getTodoListSuccessCalled += 1
    }
}
