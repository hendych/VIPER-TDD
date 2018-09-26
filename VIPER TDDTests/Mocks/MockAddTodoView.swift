//
//  MockAddTodoView.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation
@testable import VIPER_TDD

class MockAddTodoView: AddTodoViewController {
    private(set) var message: String?

    private(set) var showAlertCalled = 0

    override func showAlert(withMessage message: String, animated: Bool) {
        self.message = message
        self.showAlertCalled += 1
    }
}
