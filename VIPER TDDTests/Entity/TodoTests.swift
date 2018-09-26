//
//  TodoTests.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import XCTest
@testable import VIPER_TDD

class TodoTests: XCTestCase {
    let mockPersistentContainer = MockPersistentContainer()
    var mockCoreDataManager: MockCoreDataManager?

    override func setUp() {
        mockCoreDataManager = MockCoreDataManager(persistentContainer:
            mockPersistentContainer.container)
    }

    override func tearDown() {
        mockCoreDataManager?.deleteAllData(Todo.entityName())
    }

    func testCreateTodoModel() {
        let data: [String: Any] = [
            TodoKey.id.rawValue: "123",
            TodoKey.title.rawValue: "abcd",
            TodoKey.completed.rawValue: false
        ]

        let context = mockPersistentContainer.container.viewContext

        guard let todo = Todo.create(withData:data, context: context) as? Todo else {
            XCTFail("Created model is not Todo.")

            return
        }

        XCTAssert(todo.id == "123", "Expect created todo id is 123")
        XCTAssert(todo.title == "abcd", "Expect created todo title is abcd")
        XCTAssert(todo.completed == false, "Expect created todo completed is false")
    }

    func testUpdateTodoValue() {
        guard let emptyTodo = mockCoreDataManager?.create(ofType: Todo.self, withData: nil) else {
            XCTFail("Create todo model failed.")

            return
        }

        let data: [String: Any] = [
            TodoKey.id.rawValue: "123",
            TodoKey.title.rawValue: "abcd",
            TodoKey.completed.rawValue: false
        ]

        emptyTodo.update(withData: data)

        XCTAssert(emptyTodo.id == "123", "Expect id is 123")
        XCTAssert(emptyTodo.title == "abcd", "Expect title is abcd")
        XCTAssert(emptyTodo.completed == false, "Expect completed is false")
    }
}
