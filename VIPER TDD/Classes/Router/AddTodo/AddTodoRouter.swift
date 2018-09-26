//
//  AddTodoRouter.swift
//  VIPER TDD
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import UIKit

class AddTodoRouter: Router {
    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    var viewController: UIViewController {
        let view = AddTodoViewController()
        let interactor = AddTodoInteractor(coreDatamanager: coreDataManager)
        let presenter = AddTodoPresenter(interactor: interactor, router: self)

        presenter.view = view
        view.presenter = presenter
        interactor.output = presenter

        return view
    }
}
