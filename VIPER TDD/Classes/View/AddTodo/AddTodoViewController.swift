//
//  AddTodoViewController.swift
//  VIPER TDD
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController, AddTodoView {
    var presenter: AddTodoEventHandler?

    @IBOutlet weak var switchCompleted: UISwitch!
    @IBOutlet weak var textFieldTask: UITextField!
    
    private(set) var alertView: UIAlertController?

    init() {
        super.init(nibName: "AddTodoViewController", bundle: nil)

        loadViewIfNeeded()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    // MARK: - AddTodoView
    func showAlert(withMessage message: String, animated: Bool) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alertView = alert

        present(alert, animated: animated, completion: nil)
    }

    // MARK: - Button Action
    @IBAction func onButtonDoneClicked() {
        var data = [String: Any]()

        data[TodoKey.id.rawValue] = NSUUID().uuidString

        if let task = textFieldTask.text {
            data[TodoKey.title.rawValue] = task
        }

        data[TodoKey.completed.rawValue] = switchCompleted.isOn

        presenter?.addTodoDidClickAdd(withData: data)
    }

    @IBAction func onButtonCancelClicked() {
        presenter?.addTodoDidClickCancel()
    }
}
