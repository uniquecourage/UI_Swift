//
//  HotelSingle.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/8/14.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class HotelSingle {
    var name:String!
    var tel:String!
    var display_addr:String!
    var poi_addr:String!
    
    init(dict:AnyObject) {
        // dict取得json值
        self.name = dict["stitle"] as! String
        self.tel = dict["memo_tel"] as! String
        self.display_addr = dict["address"] as! String
        self.poi_addr = dict["xurl"] as! String
    }
}
