//
//  BaseLabel.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

class BaseLabel: UILabel {

    init(fontSize: Double, text: String, view: UIView) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        self.text = text
        view.addSubview(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
