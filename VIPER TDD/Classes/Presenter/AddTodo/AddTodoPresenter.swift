//
//  AddTodoPresenter.swift
//  VIPER TDD
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation

class AddTodoPresenter: AddTodoEventHandler, AddTodoInteractorOutput {
    weak var view: AddTodoViewController?
    let interactor: AddTodoInteractorInput
    let router: AddTodoRouter

    init(interactor: AddTodoInteractorInput, router: AddTodoRouter) {
        self.interactor = interactor
        self.router = router
    }

    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    // MARK: - AddTodoEventHandler
    func addTodoDidClickAdd(withData data: [String: Any]) {
        interactor.addTodo(withData: data)
    }

    // MARK: - AddTodoInteractorOutput
    func addTodoSuccess(todo: Todo) {
        view?.showAlert(withMessage: "Add todo success with id \(todo.id ?? "").",
            animated: true)
    }

    func addTodoFailed(withMessage message: String) {
        view?.showAlert(withMessage: message, animated: true)
    }
}
