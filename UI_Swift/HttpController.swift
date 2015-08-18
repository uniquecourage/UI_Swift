//
//  HttpController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/8/17.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

// 以results傳送讀取的資料
protocol HttpProtocol {
    func didReceiveResults(results:NSArray)
}

class HttpController:NSObject {
    var delegate:HttpProtocol?
    
    // AJAX讀取網頁資料類別
    func onSearch(url:String) {
        var nsUrl:NSURL = NSURL(string: url)!
        var request:NSURLRequest = NSURLRequest(URL: nsUrl)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {( response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            var httpResponse = response as! NSHTTPURLResponse
            if httpResponse.statusCode == 200 {
                var array: NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSArray
                self.delegate?.didReceiveResults(array)
            }
            
            })
    }
}