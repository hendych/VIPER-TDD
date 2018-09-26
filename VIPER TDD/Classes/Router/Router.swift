//
//  Router.swift
//  VIPER TDD
//
//  Created by Hendy Christianto on 26/09/18.
//  Copyright © 2018 Hendy Christianto. All rights reserved.
//

import UIKit
import CoreData

protocol Router {
    var viewController: UIViewController { get }
}

extension Router {
    var coreDataManager: CoreDataManager {
        guard let coreDataManager = (UIApplication.shared.delegate as? AppDelegate)?
            .coreDataManager else {
                fatalError("Cannot get core data manager.")
        }

        return coreDataManager
    }
}
