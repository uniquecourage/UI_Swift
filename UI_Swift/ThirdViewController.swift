//
//  ThirdViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/7/24.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var UILabel_select: UILabel!
    
    var balls:Array<Dictionary<String, String>> = [["name":"籃球","value":"600","imageName":"ic_launcher"],["name":"足球","value":"500","imageName":"ic_launcher"],["name":"棒球","value":"250","imageName":"ic_launcher"],["name":"保齡球","value":"320","imageName":"ic_launcher"],["name":"網球","value":"100","imageName":"ic_launcher"],["name":"其他","value":"350","imageName":"ic_launcher"]]
    var aryCheck:Array<Bool> = [false,false,false,false,false,false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //顯示選取項目
    func showResult() {
        UILabel_select.text = "選取項目 : "
        for (var i=0;i<balls.count;i++) {
            if aryCheck[i] {
                var ball:Dictionary<String,String> = balls[i]
                UILabel_select.text = UILabel_select.text! + ball["name"]! + " "
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return balls.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell:UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
        aryCheck[indexPath.row] = !aryCheck[indexPath.row]
        if aryCheck[indexPath.row] {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.None
        }
        showResult()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        var ball:Dictionary<String,String> = balls[indexPath.row]
        cell.textLabel!.text = ball["name"]
        cell.detailTextLabel?.text = ball["value"]
        cell.imageView!.image = UIImage(named:ball["imageName"]!)
        if aryCheck[indexPath.row] {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
}
