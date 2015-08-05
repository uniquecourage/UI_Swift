//
//  WebViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/8/5.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var UITextField_url: UITextField!
    
    @IBOutlet weak var UIWebView_url: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //載入網頁
        var url = NSURL(string: "http://www.google.com")
        var request = NSURLRequest(URL: url!)
        UIWebView_url.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StopAction(sender: UIBarButtonItem) {
        UIWebView_url.stopLoading()
    }
    
    @IBAction func RefreshAction(sender: UIBarButtonItem) {
        UIWebView_url.reload()
    }
    
    @IBAction func RewindAction(sender: UIBarButtonItem) {
        UIWebView_url.goBack()
    }
    
    @IBAction func ForwardAction(sender: UIBarButtonItem) {
        UIWebView_url.goForward()
    }
    
    @IBAction func GoClick(sender: UIButton) {
        var str = UITextField_url.text
        if !str.hasPrefix("http://") {
            str = "http://" + str
        }
        //載入網頁
        var url = NSURL(string: str)
        var request = NSURLRequest(URL: url!)
        UIWebView_url.loadRequest(request)
    }
}