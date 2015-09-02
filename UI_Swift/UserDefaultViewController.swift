//
//  UserDefaultViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/9/2.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class UserDefaultViewController: UIViewController {

    var userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults() // 建立物件
    
    @IBOutlet weak var UITextField_name: UITextField!
    
    
    @IBAction func UIButton_input(sender: UIButton) {
        userDefault.setObject(UITextField_name.text, forKey: "userName") //寫入資料
        userDefault.synchronize() //更新資料
        var alertView:UIAlertView = UIAlertView(title: "寫入資料", message: "姓名資料已寫入!", delegate: self, cancelButtonTitle: "確定")
        alertView.show()

    }
    
    
    @IBAction func UIButton_clear(sender: UIButton) {
        
        userDefault.removeObjectForKey("userName") //清除資料
        UITextField_name.text = ""
        var alertView:UIAlertView = UIAlertView(title: "清除資料", message: "姓名資料已清除!", delegate: self, cancelButtonTitle: "確定")
        alertView.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var name:String? = userDefault.objectForKey("userName") as! String? //讀取資料
        if name == nil { //沒有資料
            var alertView:UIAlertView = UIAlertView(title: "輸入姓名", message: "您尚未建立姓名資料，\n請輸入姓名!", delegate: self, cancelButtonTitle: "確定")
            alertView.show()
        } else { //資料已存在
            var msg:String = "親愛的 " + name! + "，您好!\n歡迎再次使用本程式!"
            var alertView:UIAlertView = UIAlertView(title: "歡迎", message: msg, delegate: self, cancelButtonTitle: "確定")
            alertView.show()
        }
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
