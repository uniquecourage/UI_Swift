//
//  CustomCell.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/7/31.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var UIImageView_name: UIImageView!
    @IBOutlet weak var UILabel_name: UILabel!
    @IBOutlet weak var UILabel_value: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //設定儲存格內容
    func setCell(UILabel_name:String, UILabel_value:Int, UIImageView_name:String) {
        self.UILabel_name.text = UILabel_name
        self.UILabel_value.text = String(UILabel_value)
        self.UIImageView_name.image = UIImage(named: UIImageView_name)
    }
}
