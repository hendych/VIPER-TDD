//
//  ListViewController.swift
//  tdd
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, ListView {
    var presenter: ListEventHandler?

    @IBOutlet var buttonAdd: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!

    private var todoList = [Todo]()

    init() {
        super.init(nibName: "ListViewController", bundle: nil)

        loadViewIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter?.onListViewDidRequestTodoList()
    }

    private func configureUI() {
        tableView.register(UINib(nibName: TodoTableViewCell.identifier(), bundle: nil),
                           forCellReuseIdentifier: TodoTableViewCell.identifier())

        navigationItem.rightBarButtonItem = buttonAdd
    }

    // MARK: - ListView
    func showTodoList(todoList: [Todo]) {
        self.todoList = todoList

        tableView.reloadData()
    }

    // MARK: - Button Action
    @IBAction func onButtonAddClicked() {
        presenter?.onButtonAddClicked()
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier()) {
            return cell
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch cell {
        case is TodoTableViewCell:
            guard let cell = cell as? TodoTableViewCell else { return }
            cell.todo = todoList[indexPath.row]
        default:
            break
        }
    }
}
