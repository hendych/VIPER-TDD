//
//  MockListInteractorInput.swift
//  VIPER TDDTests
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation
@testable import VIPER_TDD

class MockListInteractorInput: ListInteractorInput {
    private(set) var getTodoListCalled = 0

    func getTodoList() {
        self.getTodoListCalled += 1
    }
}
