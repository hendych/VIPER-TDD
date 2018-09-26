//
//  MockAddTodoEventHandler.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation
@testable import VIPER_TDD

class MockAddTodoEventHandler: AddTodoEventHandler {
    private(set) var data: [String: Any]?
    private(set) var addTodoDidClickAddCalled = 0

    func addTodoDidClickAdd(withData data: [String: Any]) {
        self.data = data
        self.addTodoDidClickAddCalled += 1
    }
}
