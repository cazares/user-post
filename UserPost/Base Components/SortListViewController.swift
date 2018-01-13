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
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let ascendingAction = UIAlertAction(title: ascendingTitle, style: .default, handler: { _ in
            self.sortPostsWithAscending(true)
        })
        actionSheet.addAction(ascendingAction)
        
        let descendingAction = UIAlertAction(title: descendingTitle, style: .default, handler: { _ in
            self.sortPostsWithAscending(false)
        })
        actionSheet.addAction(descendingAction)
        
        let cancelAction = UIAlertAction(title: cancel, style: .cancel, handler:nil)
        actionSheet.addAction(cancelAction)
        
        navigationController?.present(actionSheet, animated: true, completion: nil)
    }
    
    internal func sortPostsWithAscending(_ ascending: Bool) { }
}
