//
//  SortListViewController.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/12/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

class SortListViewController: UIViewController {
    let sortTitle = "Sort"
    let ascendingTitle = "Sort Ascending"
    let descendingTitle = "Sort Descending"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let sortButton = UIBarButtonItem(title: sortTitle, style: .done, target: self, action: #selector(sortButtonPressed))
        navigationItem.rightBarButtonItem = sortButton
    }
    
    public func sortButtonPressed() {
        let ascendingAction: USPEmptyBlock = { _ in
            self.sortPostsWithAscending(true)
        }
        
        let descendingAction: USPEmptyBlock = { _ in
            self.sortPostsWithAscending(false)
        }
        
        UIAlertController.showDualActionWithCancelSheet(title: sortTitle, firstActionTitle: ascendingTitle, firstActionHandler: ascendingAction, secondActionTitle: descendingTitle, secondActionHandler: descendingAction, viewController: self)
    }
    
    internal func sortPostsWithAscending(_ ascending: Bool) { }
}
