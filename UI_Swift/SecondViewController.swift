//
//  SecondViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/7/21.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var UISwitch_photo: UISwitch!
    @IBOutlet var UILabel_size: UILabel!
    @IBOutlet var UIImageView_photo: UIImageView!
    @IBOutlet var UISlider_photo: UISlider!
    @IBOutlet var UIButton_start: UIButton!
    @IBOutlet var UIProgressView_progress: UIProgressView!
    @IBOutlet var UILabel_progress: UILabel!
    @IBOutlet var UIButton_progress: UIButton!
    @IBOutlet var UILabel_select: UILabel!
    
    
    var imgWidth:CGFloat = 0
    var imgHeight:CGFloat = 0
    
    var timer:NSTimer?
    var count:Int = 0
    
    var balls:Array<String> = ["籃球", "足球", "棒球", "保齡球", "網球", "其他"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIImageView_photo.image = UIImage(named: "ic_launcher")
        imgWidth = UIImageView_photo.frame.size.width
        imgHeight = UIImageView_photo.frame.size.height
        UISlider_photo.frame.size.width = 280
        UISlider_photo.minimumValue = 0.3
        UISlider_photo.value = 1
        
        UIProgressView_progress.frame.size.width = 280
        UIProgressView_progress.progressTintColor = UIColor.redColor()
        UIProgressView_progress.trackTintColor = UIColor.greenColor()
        UIProgressView_progress.progress = 0 //起始值為0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func switchChange(sender: UISwitch) {
        if UISwitch_photo.on {
            UISlider_photo.enabled = true
        } else {
            UISlider_photo.enabled = false
        }
    }
    
    
    
    @IBAction func sliderChange(sender: UISlider) {
        if UISwitch_photo.on {
            UIImageView_photo.frame.size.width = imgWidth * CGFloat(UISlider_photo.value)
            UIImageView_photo.frame.size.height = imgHeight * CGFloat(UISlider_photo.value)
            UILabel_size.text = "大小 : \(Int(UISlider_photo.value * 100)) %"
        }
    }
    
    //定時執行函數
    func showProgress() {
        UIProgressView_progress.progress = Float(count) / 100
        UILabel_progress.text = "進度 : \(count) %"
        count++
        if count > 100 {
            timer!.invalidate()
            timer = nil
            UIButton_progress.enabled = true
        }
    }
    
    @IBAction func startClick(sender: UIButton) {
        UIButton_progress.enabled = false
        count = 0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("showProgress"), userInfo: nil, repeats: true) //啟動計時器
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return balls.count
    }

    //表格的儲存格設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = balls[indexPath.row]
        return cell
    }
    
    //點選儲存格的處理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var choice:String = balls[indexPath.row]
        UILabel_select.text = "選擇 : \(choice)"
    }
}
