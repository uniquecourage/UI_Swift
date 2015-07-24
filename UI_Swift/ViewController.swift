//
//  ViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/7/21.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var UITextField_first: UITextField!
    
    @IBOutlet var UITextField_second: UITextField!
    
    @IBOutlet var UILabel_result: UILabel!
    
    @IBOutlet var UILabel_operator: UILabel!
    
    @IBOutlet var UIImageView_change: UIImageView!
    
    @IBOutlet var datePicker1: UIDatePicker!
    
    @IBOutlet var UILabel_date: UILabel!
    
    var arrayImage = ["ic_launcher", "ic_launcher2", "ic_launcher3"]
    var p:Int = 0
    var count:Int = 0
    var arrayImageGroup:Array<UIImage> = []
    
    var dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIImageView_change.image = UIImage(named: "ic_launcher")
        count = arrayImage.count
        
        for var i = 0; i < count; i++ {
            arrayImageGroup.append(UIImage(named: arrayImage[i])!)
        }
        UIImageView_change.animationImages = arrayImageGroup
        UIImageView_change.animationDuration = NSTimeInterval(count * 2)
        UIImageView_change.layer.shadowColor = UIColor.blackColor().CGColor
        UIImageView_change.layer.shadowOffset = CGSizeMake(10, 10)
        UIImageView_change.layer.shadowOpacity = 0.8
        UIImageView_change.layer.shadowRadius = 5
        
        datePicker1.datePickerMode = UIDatePickerMode.Date
        datePicker1.locale = NSLocale(localeIdentifier: "zh_TW")
        dateFormatter.dateFormat = "西元 yyyy 年 M 月 d 日"
        UILabel_date.text = dateFormatter.stringFromDate(datePicker1.date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func UIButton_add(sender: UIButton) {
        UILabel_operator.text = "+"
    }
    
    @IBAction func UIButton_subtract(sender: UIButton) {
        UILabel_operator.text = "-"
    }
    
    @IBAction func UIButton_multiply(sender: UIButton) {
        UILabel_operator.text = "*"
    }
    
    @IBAction func UIButton_divide(sender: UIButton) {
        UILabel_operator.text = "/"
    }
    
    @IBAction func UIButton_answer(sender: UIButton) {
        var mResult = 0
        var mFirstValue = UITextField_first.text.toInt()
        var mSecondValue = UITextField_second.text.toInt()
        
        if UILabel_operator.text == "+" {
            mResult = mFirstValue! + mSecondValue!
            UILabel_result.text = String(mResult)
        } else if UILabel_operator.text == "-" {
            mResult = mFirstValue! - mSecondValue!
            UILabel_result.text = String(mResult)
        } else if UILabel_operator.text == "*" {
            mResult = mFirstValue! * mSecondValue!
            UILabel_result.text = String(mResult)
        } else if UILabel_operator.text == "/" {
            mResult = mFirstValue! / mSecondValue!
            UILabel_result.text = String(mResult)
        }
    }
    
    @IBAction func UIButton_previous(sender: UIButton) {
        p--
        if p < 0 {
            p = count - 1
        }
        UIImageView_change.image = UIImage(named: arrayImage[p])
    }
    
    @IBAction func UIButton_next(sender: UIButton) {
        p++
        if p == count {
            p = 0
        }
        UIImageView_change.image = UIImage(named: arrayImage[p])
    }
    
    @IBAction func UIButton_start(sender: UIButton) {
        UIImageView_change.startAnimating()
    }
    
    @IBAction func UIButton_end(sender: UIButton) {
        UIImageView_change.stopAnimating()
    }
    
    //Sent Events選擇value change
    @IBAction func dateChange(sender: UIDatePicker) {
        UILabel_date.text = dateFormatter.stringFromDate(datePicker1.date)
    }
    
    
    
}

