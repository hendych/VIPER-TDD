//
//  MockListEventHandler.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation
@testable import VIPER_TDD

class MockListEventHandler: ListEventHandler {
    private(set) var onRequestTodoListCalled = 0
    private(set) var onButtonAddClickedCalled = 0

    func onListViewDidRequestTodoList() {
        self.onRequestTodoListCalled += 1
    }

    func onButtonAddClicked() {
        self.onButtonAddClickedCalled += 1
    }
}
