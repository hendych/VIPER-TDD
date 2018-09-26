//
//  ListPresenterTests.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import XCTest
@testable import VIPER_TDD

class ListPresenterTests: XCTestCase {

    var mockRouter: MockListRouter?
    var mockView: MockListView?
    var mockInteractor: MockListInteractorInput?
    var presenter: ListPresenter?

    let mockContainer = MockPersistentContainer().container
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

    var mockCoreDataManager: MockCoreDataManager?

    override func setUp() {
        let router = MockListRouter()
        let interactor = MockListInteractorInput()

        mockView = MockListView()
        mockRouter = router
        mockInteractor = interactor

        presenter = ListPresenter(interactor: interactor, router: router)
        presenter?.view = mockView

        mockCoreDataManager = MockCoreDataManager(persistentContainer: mockContainer)
    }

    override func tearDown() {
        mockCoreDataManager?.deleteAllData(Todo.entityName())
    }

    func testOutputGetTodoListSucess() {

        guard let todo1 = Todo.create(withData: data1, context: mockContainer.viewContext) as? Todo,
            let todo2 = Todo.create(withData: data2, context: mockContainer.viewContext) as? Todo else {
                XCTFail("Failed when creating Todo model.")

                return
        }

        presenter?.getTodoListSuccess(todoList: [todo1, todo2])

        XCTAssert(mockView?.showTodoListCalled == 1, "Expect showTodoList called once")
        XCTAssert(mockView?.todoList == [todo1, todo2], "Expected todoList sent is not the same!")
    }

    func testHandleEventRequestTodoList() {
        presenter?.onListViewDidRequestTodoList()

        XCTAssert(mockInteractor?.getTodoListCalled == 1,
                  "Expect calling getTodoList once.")
    }

    func testHandleEventOnButtonAddClicked() {
        presenter?.onButtonAddClicked()

        XCTAssert(mockRouter?.pushAddTodoListCalled == 1,
                  "Expect pushAddTodoList called once.")
        XCTAssert(mockRouter?.view?.isEqual(mockView) ?? false,
                  "Expect sent view is the same injected view in the presenter.")
    }
}
