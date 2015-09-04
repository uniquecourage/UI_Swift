//
//  CreateFileViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/9/4.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class CreateFileViewController: UIViewController {

    @IBOutlet weak var UITextField_id: UITextField!
    
    @IBOutlet weak var UITextField_password: UITextField!
    
    @IBOutlet weak var UILabel_content: UILabel!
    
    var fm:NSFileManager = NSFileManager() //建立檔案管理物件
    var fileName:String = NSHomeDirectory() + "/Documents/" + "password.txt" //密碼檔路徑
    var readContent:NSString = "" //檔案內容
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UILabel_content.numberOfLines = 0 //Label可多行顯示
        // 如果密碼檔已存在，就讀出並顯示
        if fm.fileExistsAtPath(fileName) {
            readContent = NSString(contentsOfFile: fileName, encoding: NSUTF8StringEncoding, error:nil)!
            UILabel_content.text = readContent as String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //加入資料
    @IBAction func insertClick(sender: UIButton) {
        if UITextField_id.text == "" || UITextField_password.text == "" {
            var alertView:UIAlertView = UIAlertView(title: "輸入確認", message: "帳號及密碼都要輸入!", delegate: self, cancelButtonTitle: "確定") // 若有欄位未輸入就給予提示
            alertView.show()
        } else { // 帳號及密碼皆已輸入
            if !fm.fileExistsAtPath(fileName) { //如果密碼檔不存在就興建
                fm.createFileAtPath(fileName, contents: nil, attributes: nil)
            }
            readContent = String(readContent) + UITextField_id.text + "\n" + UITextField_password.text + "\n" //加入輸入的帳號密碼
            var flag = readContent.writeToFile(fileName, atomically: true, encoding: NSUTF8StringEncoding, error: nil) //寫入檔案
            if flag { //存檔成功
                var alertView:UIAlertView = UIAlertView(title: "存檔", message: "資料寫入成功!", delegate: self, cancelButtonTitle: "確定")
                alertView.show()
                UILabel_content.text = readContent as String
            } else { //存檔失敗
                var alertView:UIAlertView = UIAlertView(title: "失敗", message: "資料寫入失敗!", delegate: self, cancelButtonTitle: "確定")
                alertView.show()
            }
        }
    }
    
    @IBAction func clearClick(sender: UIButton) {
        readContent = "" // 清除所有資料
        var flag = readContent.writeToFile(fileName, atomically: true, encoding: NSUTF8StringEncoding, error: nil) //將空資料寫入檔案
        if flag { // 存檔成功
            UILabel_content.text = readContent as String
            UITextField_id.text = ""
            UITextField_password.text = ""
            var alertView:UIAlertView = UIAlertView(title: "存檔", message: "資料寫入成功!", delegate: self, cancelButtonTitle: "確定")
            alertView.show()
        } else { //存檔失敗
            var alertView:UIAlertView = UIAlertView(title: "失敗", message: "資料清除失敗!", delegate: self, cancelButtonTitle: "確定")
            alertView.show()
        }
        UILabel_content.text = ""
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
