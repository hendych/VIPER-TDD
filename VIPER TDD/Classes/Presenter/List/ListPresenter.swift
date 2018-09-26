//
//  ListPresenter.swift
//  tdd
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation

class ListPresenter: ListEventHandler, ListInteractorOutput {
    weak var view: ListViewController?
    let interactor: ListInteractorInput
    let router: ListRouter

    init(interactor: ListInteractorInput, router: ListRouter) {
        self.interactor = interactor
        self.router = router
    }

    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    // MARK: - ListEventHandler
    func onListViewDidRequestTodoList() {
        interactor.getTodoList()
    }

    func onButtonAddClicked() {
        router.pushAddTodoListViewController(from: view, animated: true)
    }

    // MARK: - Output
    func getTodoListSuccess(todoList: [Todo]) {
        view?.showTodoList(todoList: todoList)
    }
}
