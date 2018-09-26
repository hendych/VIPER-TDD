//
//  TodoTableViewCell.swift
//  VIPER TDD
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonCheck: UIButton!
    @IBOutlet weak var labelTitle: UILabel!

    weak var todo: Todo? {
        didSet {
            bindView()
        }
    }

    static func identifier() -> String {
        return "TodoTableViewCell"
    }

    // MARK: - Binding Data
    private func bindView() {
        guard let todo = todo else { return }

        labelTitle.text = todo.title
        buttonCheck.isSelected = todo.completed
    }
}
