//
//  HotelMapViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/8/14.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class HotelMapViewController: UIViewController {
    @IBOutlet weak var UILabel_map: UILabel!
    @IBOutlet weak var UIWebView_map: UIWebView!
    var hotelName:String = ""
    var hotelAddr:NSString = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UILabel_map.text = hotelName
        //依地址在瀏覽器顯示地圖
        var address:NSString = "http://maps.google.com/maps?hl=zh-TW&q=" + (hotelAddr as String)
        var url:NSURL = NSURL(string: address.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)!
        var request:NSURLRequest = NSURLRequest(URL: url)
        self.UIWebView_map.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
