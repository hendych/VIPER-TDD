//
//  AddTodoInteractor.swift
//  VIPER TDD
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation

class AddTodoInteractor: AddTodoInteractorInput {
    weak var output: AddTodoInteractorOutput?

    private let coreDataManager: CoreDataManager

    init(coreDatamanager: CoreDataManager) {
        self.coreDataManager = coreDatamanager
    }

    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    // MARK: - AddTodoInteractorInput
    func addTodo(withData data: [String : Any]) {
        if let task = data[TodoKey.title.rawValue] as? String,
            task.count < 5 {
            output?.addTodoFailed(withMessage: "Minimum character task is 5.")

            return
        }

        guard let newTodo = coreDataManager.create(ofType: Todo.self, withData: data) else {
            output?.addTodoFailed(withMessage: "Add todo failed.")
            return
        }

        output?.addTodoSuccess(todo: newTodo)
    }
}
