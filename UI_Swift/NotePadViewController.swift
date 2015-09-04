//
//  NotePadViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/9/4.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class NotePadViewController: UIViewController {

    @IBOutlet weak var UITextField_filename: UITextField!
    
    @IBOutlet weak var UITextView_content: UITextView!
    
    @IBOutlet weak var UITableView_file: UITableView!
    
    var txtFileList:Array<String> = [] // 檔案名稱陣列
    var fm:NSFileManager = NSFileManager() // 建立檔案管理物件
    var rootPath = NSHomeDirectory() + "/Documents/" // 根目錄
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtFileList.removeAll(keepCapacity: true) // 清除檔案列表
        var fileList:Array<NSString> = fm.subpathsAtPath(rootPath) as! Array<NSString> //取得所有檔案名稱
        // 取得附加檔名為 .txt的檔案
        for file in fileList {
            if file.substringWithRange(NSRange(location: file.length-4, length: 4)) == ".txt" {
                txtFileList.append(file as String)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveClick(sender: UIButton) {
        if UITextView_content.text == "" || UITextField_filename.text == "" {
            var alertView:UIAlertView = UIAlertView(title: "輸入確認", message: "文件名稱及內容都必須輸入!", delegate: self, cancelButtonTitle: "確定") // 若有欄位未輸入就給予提示
            alertView.show()
        } else {
            var file:NSString = UITextField_filename.text
            // 若字尾不是 .txt就加上 .txt
            if file.substringWithRange(NSRange(location: file.length-4, length: 4)) != ".txt" {
                UITextField_filename.text = UITextField_filename.text + ".txt"
            }
            var fileName = rootPath + UITextField_filename.text // 完整路徑
            var flag = UITextView_content.text.writeToFile(fileName, atomically: true, encoding: NSUTF8StringEncoding, error: nil) // 寫入檔案
            
            if flag { // 寫入成功
                var alertView:UIAlertView = UIAlertView(title: "成功", message: "文件寫入成功!", delegate: self, cancelButtonTitle: "確定") //
                alertView.show()
                if find(txtFileList, UITextField_filename.text) == nil { // 新檔案
                    txtFileList.append(UITextField_filename.text) // 加入檔案名稱陣列
                }
            } else { // 寫入失敗
                var alertView:UIAlertView = UIAlertView(title: "失敗", message: "文件寫入失敗!", delegate: self, cancelButtonTitle: "確定") //
                alertView.show()
            }
        }
        UITableView_file.reloadData() // 更新檔案列表
    }
    
    @IBAction func deleteClick(sender: UIButton) {
        if UITextField_filename.text == "" { //文件名稱未輸入
            var alertView:UIAlertView = UIAlertView(title: "選取", message: "文件名稱必須選取!", delegate: self, cancelButtonTitle: "確定") //
            alertView.show()
        } else {
            var fileName = rootPath + UITextField_filename.text // 完整路徑
            var flag = fm.removeItemAtPath(fileName, error: nil) // 刪除檔案
            if flag { // 刪除成功
                var alertView:UIAlertView = UIAlertView(title: "成功", message: "文件刪除成功!", delegate: self, cancelButtonTitle: "確定") //
                alertView.show()
                // 由檔案列表移除檔案名稱
                var n:Int = find(txtFileList, UITextField_filename.text)!
                txtFileList.removeAtIndex(n)
                // 清除輸入框及內容
                UITextField_filename.text = ""
                UITextView_content.text = ""
            } else { // 刪除失敗
                var alertView:UIAlertView = UIAlertView(title: "失敗", message: "文件刪除失敗!", delegate: self, cancelButtonTitle: "確定") //
                alertView.show()
            }
        }
        UITableView_file.reloadData() // 更新檔案列表
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return txtFileList.count
    }
    
    func tableView(tableView: UITableView, cellForRowsInSection indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = txtFileList[indexPath.row] // 列表項目內容
        return cell
    }
    
    //選取檔案名稱
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 取得檔案內容
        UITextField_filename.text = txtFileList[indexPath.row]
        var fileName = rootPath + UITextField_filename.text
        var readContent = NSString(contentsOfFile: fileName, encoding: NSUTF8StringEncoding, error: nil)
        UITextView_content.text = String(readContent!) // 顯示檔案內容
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
