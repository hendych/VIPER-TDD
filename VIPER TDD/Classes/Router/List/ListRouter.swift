//
//  ListRouter.swift
//  tdd
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import UIKit

class ListRouter: Router {
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    var viewController: UIViewController {
        let view = ListViewController()
        let interactor = ListInteractor(coreDatamanager: coreDataManager)
        let presenter = ListPresenter(interactor: interactor, router: self)
        let navigationController = UINavigationController(rootViewController: view)

        presenter.view = view
        view.presenter = presenter
        interactor.output = presenter

        return navigationController
    }

    func pushAddTodoListViewController(from view: UIViewController?, animated: Bool) {
        let addTodoRouter = AddTodoRouter()

        view?.navigationController?.pushViewController(addTodoRouter.viewController,
                                                       animated: animated)
        
    }
}
