//
//  ListInteractorIO.swift
//  tdd
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation

protocol ListInteractorInput: class {
    func getTodoList()
}

protocol ListInteractorOutput: class {
    func getTodoListSuccess(todoList: [Todo])
}
