//
//  UIAlertController+Util.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/12/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import Foundation

extension UIAlertController {
    
    static public func showAlert(title: String, message: String, viewController: UIViewController, onConfirm: @escaping USPEmptyBlock) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(noAction)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { _ in onConfirm() })
        alert.addAction(yesAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static public func showDualActionWithCancelSheet(title: String, firstActionTitle: String, firstActionHandler: @escaping USPEmptyBlock, secondActionTitle: String, secondActionHandler: @escaping USPEmptyBlock, viewController: UIViewController) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let firstAction = UIAlertAction(title: firstActionTitle, handler: firstActionHandler)
        actionSheet.addAction(firstAction)
        
        let secondAction = UIAlertAction(title: secondActionTitle, handler: secondActionHandler)
        actionSheet.addAction(secondAction)
        
        let cancelAction = UIAlertAction(title: cancel, style: .cancel, handler:nil)
        actionSheet.addAction(cancelAction)
        
        viewController.navigationController?.present(actionSheet, animated: true, completion: nil)
    }
}
