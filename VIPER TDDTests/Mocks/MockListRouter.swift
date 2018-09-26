//
//  MockListRouter.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import UIKit
@testable import VIPER_TDD

class MockListRouter: ListRouter {
    private(set) var view: UIViewController?
    private(set) var pushAddTodoListCalled = 0

    override func pushAddTodoListViewController(from view: UIViewController?,
                                                animated: Bool) {
        self.view = view
        self.pushAddTodoListCalled += 1
    }
}
