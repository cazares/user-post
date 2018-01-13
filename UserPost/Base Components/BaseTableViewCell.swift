//
//  BaseTableViewCell.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    let usernameLabelFontSize = CGFloat(15.0)
    let addressLabelFontSize = CGFloat(12.0)
    let numAddressLines = 0
    let labelHeight = CGFloat(40.0)
    
    private var label: UILabel!
    var labelText = emptyString {
        willSet(newText) {
            label.text = newText
            textLabel?.text = newText
        }
    }
    
    private var detailLabel: UILabel!
    var detailText = emptyString {
        willSet(newText) {
            detailLabel.text = newText
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        textLabel?.isHidden = true
        
        label = initLabel(fontSize: usernameLabelFontSize)
        label.font = UIFont.boldSystemFont(ofSize: usernameLabelFontSize)
        
        detailLabel = initLabel(fontSize: addressLabelFontSize)
        detailLabel.numberOfLines = numAddressLines
        
        let metrics: [String: Any] = ["pad": padding,   
                                      "labelHeight": labelHeight]
        let views: [String: Any] = ["label": label,
                                    "detail": detailLabel]
        
        lhs_addConstraints("H:|-(pad)-[label]-(pad)-|", metrics: metrics, views: views)
        lhs_addConstraints("H:|-(pad)-[detail]-(pad)-|", metrics: metrics, views: views)
        
        lhs_addConstraints("V:|-(pad)-[label(labelHeight)]-[detail]-(pad)-|", metrics: metrics, views: views)
    }
    
    private func initLabel(fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: fontSize)
        addSubview(label)
        return label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
