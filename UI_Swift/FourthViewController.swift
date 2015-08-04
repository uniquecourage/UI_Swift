//
//  FourthViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/7/30.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate {
    
    @IBOutlet weak var UILabel_select: UILabel!
    @IBOutlet weak var UITableView_flower: UITableView!
   
    @IBOutlet weak var UIVIew_button: UIView!
    @IBOutlet weak var UILabel_result: UILabel!
    var buttonTitle:String = ""
    
    @IBOutlet weak var UIView_login: UIView!
    @IBOutlet weak var UILabel_login: UILabel!
    let UserName1:String = "John"
    let Password1:String = "1234"
    let UserName2:String = "Mary"
    let Password2:String = "4321"
    var alertView1:UIAlertView = UIAlertView()
    var alertView2:UIAlertView = UIAlertView()
    
    var arrFlowers:Array<Flower> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupFlowers()
        
        //設定圓角按鈕
        UIVIew_button.layer.cornerRadius = 10 //圓角角度
        UIView_login.layer.cornerRadius = 10 //圓角角度
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //設定表格的列數
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == UITableView_flower {
            return arrFlowers.count
        } else {
            return 0
        }
    }
    
    //表格的儲存格設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //if tableView == UITableView_flower {
            //以CustomCell作為cell類別
            let cell:CustomCell = tableView.dequeueReusableCellWithIdentifier("cell") as! CustomCell
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor.yellowColor()
            } else {
                cell.backgroundColor = UIColor.orangeColor()
            }
            let flower = arrFlowers[indexPath.row]
            cell.setCell(flower.name, UILabel_value:flower.value, UIImageView_name:flower.imageName)
            return cell
        //} else {
            //return
        //}
    }
    
    func setupFlowers() {
        var flower1 = Flower(name: "百合", value: 200, imageName: "ic_launcher")
        var flower2 = Flower(name: "玫瑰", value: 300, imageName: "ic_launcher")
        var flower3 = Flower(name: "水仙", value: 150, imageName: "ic_launcher")
        var flower4 = Flower(name: "鬱金香", value: 400, imageName: "ic_launcher")
        var flower5 = Flower(name: "薰衣草", value: 100, imageName: "ic_launcher")
        arrFlowers.append(flower1)
        arrFlowers.append(flower2)
        arrFlowers.append(flower3)
        arrFlowers.append(flower4)
        arrFlowers.append(flower5)
    }
    
    //點選儲存格的處理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == UITableView_flower {
            var choice:String = arrFlowers[indexPath.row].name
            UILabel_select.text = "目前選擇 : \(choice)"
        } else {
            
        }
    }
    
    @IBAction func UIButton_alert1(sender: UIButton) {
        // 以建構式建立
        var alertView:UIAlertView = UIAlertView(title: "確認視窗", message: "以建構式建立", delegate:nil, cancelButtonTitle: "取消", otherButtonTitles: "確定")
        alertView.show()
    }
    
    @IBAction func UIButton_alert2(sender: UIButton) {
        // 建立物件並設定其屬性和按鈕
        var alertView:UIAlertView = UIAlertView()
        alertView.title = "確認視窗"
        alertView.message = "建立物件並設定其屬性和按鈕"
        alertView.delegate = nil
        alertView.addButtonWithTitle("取消")
        alertView.addButtonWithTitle("確定")
        alertView.show()
    }
    
    @IBAction func UIButton_alertaction(sender: UIButton) {
        // 建立物件並定其屬性和按鈕
        var alertView:UIAlertView = UIAlertView()
        alertView.title = "確認視窗"
        alertView.message = "取得按鈕文字"
        alertView.delegate = self
        alertView.addButtonWithTitle("取消")
        alertView.addButtonWithTitle("確定")
        alertView.show()
        alertView1 = alertView
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        // 分別針對不同的alertView做處理
        if alertView == alertView1 {
            //取得按鈕的文字
            buttonTitle = alertView.buttonTitleAtIndex(buttonIndex)
            UILabel_result.text = "已按下 \(buttonTitle) 按鈕!"
            switch (buttonIndex) {
            case 0: //按下取消鈕的處理
                println("取消")
                break
            case 1: //按下確定鈕的處理
                println("確定")
                break
            default: //其他狀況
                println("錯誤")
            }
        } else {
            switch (buttonIndex) {
            case 0:
                // 取消
                break
            case 1:
                // 登入
                var textUserName:UITextField! = alertView.textFieldAtIndex(0)
                var textPassword:UITextField! = alertView.textFieldAtIndex(1)
                if (UserName1 == textUserName.text && Password1 == textPassword.text) {
                    UILabel_login.text = "歡迎光臨 : \(textUserName.text)"
                } else if (UserName2 == textUserName.text && Password2 == textPassword.text) {
                    UILabel_login.text = "歡迎光臨 : \(textUserName.text)"
                } else {
                    UILabel_login.text = "帳號或密碼錯誤"
                }
                break
            default:
                //其他
                println("錯誤")
                break
            }
        }

    }
    
    
    @IBAction func UIButtin_login(sender: UIButton) {
        // 以建構式建立對話方塊
        var alertView = UIAlertView(title: "登入",
            message: "歡迎光臨",
            delegate: self,
            cancelButtonTitle: "取消",
            otherButtonTitles: "登入"
        )
        // 可輸入帳號和密碼
        alertView.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
        alertView.show()
        alertView2 = alertView
    }
    
}