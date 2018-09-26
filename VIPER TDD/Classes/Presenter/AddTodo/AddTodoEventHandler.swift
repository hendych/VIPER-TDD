//
//  AddTodoEventHandler.swift
//  VIPER TDD
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation

protocol AddTodoEventHandler: class {
    func addTodoDidClickAdd(withData data: [String: Any])

    func addTodoDidClickCancel()
}
