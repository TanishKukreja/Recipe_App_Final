//
//  CustomTableViewCell.swift
//  Recipe_App_Final
//
//  Created by Tanish_MAC on 07/03/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
        
        override class func awakeFromNib() {
            super.awakeFromNib()
        }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }


}
