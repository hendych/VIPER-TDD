//
//  ListViewTests.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import XCTest
@testable import VIPER_TDD

class ListViewTests: XCTestCase {

    let mockContainer = MockPersistentContainer().container
    
    var mockEventHandler: MockListEventHandler?
    var view: ListViewController?

    var mockCoreDataManager: MockCoreDataManager?

    let data1: [String: Any] = [
        TodoKey.id.rawValue: "123",
        TodoKey.title.rawValue: "title",
        TodoKey.completed.rawValue: true
    ]
    let data2: [String: Any] = [
        TodoKey.id.rawValue: "234",
        TodoKey.title.rawValue: "title two",
        TodoKey.completed.rawValue: false
    ]

    override func setUp() {
        mockEventHandler = MockListEventHandler()

        view = ListViewController()
        view?.presenter = mockEventHandler

        mockCoreDataManager = MockCoreDataManager(persistentContainer: mockContainer)
    }

    override func tearDown() {
        mockCoreDataManager?.deleteAllData(Todo.entityName())
    }

    func testShowTodoListDidShowCorrectData() {
        guard let todo1 = Todo.create(withData: data1, context: mockContainer.viewContext) as? Todo,
            let todo2 = Todo.create(withData: data2, context: mockContainer.viewContext) as? Todo else {
                XCTFail("Failed when creating Todo model.")

                return
        }

        view?.showTodoList(todoList: [todo1, todo2])

        XCTAssert(view?.tableView.numberOfRows(inSection: 0) == 2,
                  "Expect number of cell shown is 2")

        guard let cell1 = view?.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
            as? TodoTableViewCell else {
                XCTFail("Expect first row is TodoTableViewCell.")

                return
        }

        XCTAssert(cell1.todo == todo1, "Expect first row is showing todo1.")
    }

    func testViewWillAppearDidRequestTodoList() {
        view?.viewWillAppear(false)

        XCTAssert(mockEventHandler?.onRequestTodoListCalled == 1,
                  "Expect onRequestTodoList called once on viewWillAppear()")
    }

    func testActionButtonAdd() {
        view?.onButtonAddClicked()

        XCTAssert(mockEventHandler?.onButtonAddClickedCalled == 1,
                  "Expect onButtonAddClicked called once")
    }
}
