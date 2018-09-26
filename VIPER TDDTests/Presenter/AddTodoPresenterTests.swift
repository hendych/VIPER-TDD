//
//  AddTodoPresenterTests.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import XCTest
@testable import VIPER_TDD

class AddTodoPresenterTests: XCTestCase {

    var mockRouter: MockAddTodoRouter?
    var mockView: MockAddTodoView?
    var mockInteractor: MockAddTodoInteractorInput?
    var presenter: AddTodoPresenter?

    let mockContainer = MockPersistentContainer().container
    let data: [String: Any] = [
        TodoKey.id.rawValue: "123",
        TodoKey.title.rawValue: "title",
        TodoKey.completed.rawValue: true
    ]
    var mockCoreDataManager: MockCoreDataManager?

    override func setUp() {
        let router = MockAddTodoRouter()
        let interactor = MockAddTodoInteractorInput()

        mockView = MockAddTodoView()
        mockRouter = router
        mockInteractor = interactor

        presenter = AddTodoPresenter(interactor: interactor, router: router)
        presenter?.view = mockView

        mockCoreDataManager = MockCoreDataManager(persistentContainer: mockContainer)
    }

    override func tearDown() {
        mockCoreDataManager?.deleteAllData(Todo.entityName())
    }

    func testOutputAddTodoSuccess() {
        guard let todo = Todo.create(withData: data, context: mockContainer.viewContext) as? Todo else {
            XCTFail("Failed when creating Todo model.")

            return
        }

        presenter?.addTodoSuccess(todo: todo)

        XCTAssert(mockView?.showAlertCalled == 1, "Expect showAlert called once")
        XCTAssert(mockView?.message == "Add todo success with id 123.",
                  "Expect alert with message 'Add todo success with id 123.' showing")
    }

    func testOutputAddTodoFailed() {
        let message = "Error message"

        presenter?.addTodoFailed(withMessage: message)

        XCTAssert(mockView?.showAlertCalled == 1, "Expect showAlert called once")
        XCTAssert(mockView?.message == message,
                  "Expect alert with message 'Error message' showing")
    }

    func testHandleEventAdd() {
        presenter?.addTodoDidClickAdd(withData: data)

        XCTAssert(mockInteractor?.addTodoCalled == 1, "Expect addTodo called once")

        guard let paramData = mockInteractor?.data else {
            XCTFail("Expect parameter sent is not null")

            return
        }

        XCTAssert(NSDictionary(dictionary: data).isEqual(to: paramData),
                  "Expect sent parameters is equal to data input")
    }
}
