//
//  ListInteractor.swift
//  tdd
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation

class ListInteractor: ListInteractorInput {
    weak var output: ListInteractorOutput?

    private let coreDataManager: CoreDataManager

    init(coreDatamanager: CoreDataManager) {
        self.coreDataManager = coreDatamanager
    }

    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    func getTodoList() {
        let todoList = coreDataManager.fetch(ofType: Todo.self)

        output?.getTodoListSuccess(todoList: todoList)
    }
}
