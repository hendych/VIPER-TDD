//
//  ListRouterTests.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import XCTest
@testable import VIPER_TDD

class ListRouterTests: XCTestCase {

    var router = ListRouter()

    func testNavigateToAddTodoView() {
        guard let navController = router.viewController as? UINavigationController else {
            XCTFail("Push view with non navigation controller type.")

            return
        }

        guard let view = navController.viewControllers.first as? ListViewController else {
            XCTFail("Expect root view is ListViewController.")

            return
        }

        router.pushAddTodoListViewController(from: view, animated: false)
        
        XCTAssert(navController.viewControllers.last is AddTodoViewController,
                  "Expect pushed view is AddTodoViewController")
    }
}
