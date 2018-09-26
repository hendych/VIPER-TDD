//
//  ListEventHandler.swift
//  tdd
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import Foundation

protocol ListEventHandler: class {
    func onListViewDidRequestTodoList()

    func onButtonAddClicked()
}
