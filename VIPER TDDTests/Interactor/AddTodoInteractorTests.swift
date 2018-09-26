//
//  AddTodoInteractorTests.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import XCTest
@testable import VIPER_TDD

class AddTodoInteractorTests: XCTestCase {
    var mockCoreDataManager: MockCoreDataManager?
    var mockOutput: MockAddTodoInteractorOutput?
    var interactor: AddTodoInteractor?

    override func setUp() {
        let coreDataManager = MockCoreDataManager(persistentContainer: MockPersistentContainer().container)

        mockOutput = MockAddTodoInteractorOutput()
        mockCoreDataManager = coreDataManager

        interactor = AddTodoInteractor(coreDatamanager: coreDataManager)
        interactor?.output = mockOutput
    }

    override func tearDown() {
        mockCoreDataManager?.deleteAllData(Todo.entityName())
    }

    func testAddTodoFailedNilCreatedEntity() {
        let data: [String: Any] = [
            TodoKey.id.rawValue: "444",
            TodoKey.title.rawValue: "Adding Memory Leak Free VIPER TDD",
            TodoKey.completed.rawValue: true
        ]

        mockCoreDataManager?.stubNil = true

        interactor?.addTodo(withData: data)

        XCTAssert(mockOutput?.addTodoSuccessCalled == 0, "Expect addTodoSuccess is not called")
        XCTAssert(mockOutput?.addTodoFailedCalled == 1, "Expect addTodoFailed called once")
        XCTAssert(mockOutput?.message == "Add todo failed.",
                  "Expect addTodoFailed with message 'Add todo failed.'")
    }

    func testAddTodoValidationWithTitleLessThanFive() {
        let data: [String: Any] = [
            TodoKey.id.rawValue: "444",
            TodoKey.title.rawValue: "Aw",
            TodoKey.completed.rawValue: true
        ]

        interactor?.addTodo(withData: data)

        XCTAssert(mockOutput?.addTodoSuccessCalled == 0, "Expect addTodoSuccess is not called")
        XCTAssert(mockOutput?.addTodoFailedCalled == 1, "Expect addTodoFailed called once")
        XCTAssert(mockOutput?.message == "Minimum character task is 5.",
                  "Expect addTodoFailed with message 'Minimum character task is 5.'")
    }

    func testAddTodoSuccess() {
        let data: [String: Any] = [
            TodoKey.id.rawValue: "444",
            TodoKey.title.rawValue: "Adding Memory Leak Free VIPER TDD",
            TodoKey.completed.rawValue: true
        ]

        interactor?.addTodo(withData: data)

        XCTAssert(mockOutput?.addTodoSuccessCalled == 1, "Expect addTodoSuccess called once")
        XCTAssert(mockOutput?.todo?.id == "444", "Expect output todo id is 444")
        XCTAssert(mockOutput?.todo?.title == "Adding Memory Leak Free VIPER TDD",
                  "Expect output todo id is Adding Memory Leak Free VIPER TDD")
        XCTAssert(mockOutput?.todo?.completed == true, "Expect output todo id is true")
        XCTAssert(mockOutput?.addTodoFailedCalled == 0, "Expect addTodoFailed is not called")
    }
}
