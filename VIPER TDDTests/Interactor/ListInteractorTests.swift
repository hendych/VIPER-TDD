//
//  ListInteractorTests.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import XCTest
@testable import VIPER_TDD

class ListInteractorTests: XCTestCase {

    var mockCoreDataManager: MockCoreDataManager?
    var mockOutput: MockListInteractorOutput?
    var interactor: ListInteractor?

    override func setUp() {
        let coreDataManager = MockCoreDataManager(persistentContainer: MockPersistentContainer().container)

        mockOutput = MockListInteractorOutput()
        mockCoreDataManager = coreDataManager

        interactor = ListInteractor(coreDatamanager: coreDataManager)
        interactor?.output = mockOutput
    }

    override func tearDown() {
        mockCoreDataManager?.deleteAllData(Todo.entityName())
    }

    func testGetTodoListSuccess() {
        // Insert dummy data to core data
        let data1: [String: Any] = [
            TodoKey.id.rawValue: "123",
            TodoKey.title.rawValue: "Todo one",
            TodoKey.completed.rawValue: true
        ]
        let data2: [String: Any] = [
            TodoKey.id.rawValue: "234",
            TodoKey.title.rawValue: "Todo two",
            TodoKey.completed.rawValue: false
        ]

        guard let todo1 = mockCoreDataManager?.create(ofType: Todo.self, withData: data1) else {
            XCTFail("Failed creating Todo model")

            return
        }

        guard let todo2 = mockCoreDataManager?.create(ofType: Todo.self, withData: data2) else {
            XCTFail("Failed creating Todo model")

            return
        }

        interactor?.getTodoList()

        XCTAssert(mockOutput?.getTodoListSuccessCalled == 1,
                  "Expect getTodoListSuccess called once")
        XCTAssert(mockOutput?.todoList?.contains(todo1) ?? false,
                  "Ouput doesn't contain expected value todo1")
        XCTAssert(mockOutput?.todoList?.contains(todo2) ?? false,
                  "Ouput doesn't contain expected value todo2")
    }
}
