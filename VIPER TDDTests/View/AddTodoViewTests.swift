//
//  AddTodoViewTests.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import XCTest
@testable import VIPER_TDD

class AddTodoViewTests: XCTestCase {

    let mockContainer = MockPersistentContainer().container

    var mockEventHandler: MockAddTodoEventHandler?
    var view: AddTodoViewController?

    override func setUp() {
        mockEventHandler = MockAddTodoEventHandler()

        view = AddTodoViewController()
        view?.presenter = mockEventHandler
    }

    override func tearDown() {
    }

    func testShowAlert() {
        view?.showAlert(withMessage: "abc", animated: false)

        XCTAssert(view?.alertView?.message == "abc",
                  "Expect alert view shown with message 'abc'")
    }

    func testActionButtonDoneClicked() {
        view?.switchCompleted.isOn = true
        view?.textFieldTask.text = "Testing"

        view?.onButtonDoneClicked()

        XCTAssert(mockEventHandler?.addTodoDidClickAddCalled == 1,
                  "Expect addTodoDidClickAdd called once")
        XCTAssert(mockEventHandler?.data?[TodoKey.id.rawValue] != nil,
                  "Expect inserted data id is not null")
        XCTAssert(mockEventHandler?.data?[TodoKey.title.rawValue] as? String == "Testing",
                  "Expect inserted data title is 'Testing'")
        XCTAssert(mockEventHandler?.data?[TodoKey.completed.rawValue] as? Bool == true,
                  "Expect inserted data completed is true")
    }
}
