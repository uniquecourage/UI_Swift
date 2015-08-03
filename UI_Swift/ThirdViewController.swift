//
//  ThirdViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/7/24.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var UILabel_select: UILabel!
    @IBOutlet weak var UITableView_ball: UITableView!
    
    
    @IBOutlet weak var UILabel_movie: UILabel!
    @IBOutlet weak var UITextView_movie: UITextField!
    @IBOutlet weak var UITableView_movie: UITableView!
    
    
    var balls:Array<Dictionary<String, String>> = [["name":"籃球","value":"600","imageName":"ic_launcher"],["name":"足球","value":"500","imageName":"ic_launcher"],["name":"棒球","value":"250","imageName":"ic_launcher"],["name":"保齡球","value":"320","imageName":"ic_launcher"],["name":"網球","value":"100","imageName":"ic_launcher"],["name":"其他","value":"350","imageName":"ic_launcher"]]
    var aryCheck:Array<Bool> = [false,false,false,false,false,false]
    
    var movies:NSMutableArray = ["侏羅紀世界","小小兵","魔鬼終結者","蟻人","不可能的任務","復仇者"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // multiple table
        self.UITableView_ball.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.UITableView_movie.registerClass(UITableViewCell.self, forCellReuseIdentifier: "moviecell")
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
        if tableView == UITableView_ball {
            return balls.count
        } else {
            return movies.count
        }
    }
    
    //點選儲存格的處理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if tableView == UITableView_ball {
            
            var cell:UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
            aryCheck[indexPath.row] = !aryCheck[indexPath.row]
            if aryCheck[indexPath.row] {
                cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            } else {
                cell!.accessoryType = UITableViewCellAccessoryType.None
            }
            showResult()
        } else {
            var choice:String = movies[indexPath.row] as! String
            UILabel_movie.text = "電影選取 : \(choice)"
        }
        
    }
    
    //表格的儲存格設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if tableView == UITableView_ball {
            
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
        } else {
            var moviecell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("moviecell", forIndexPath: indexPath) as! UITableViewCell
            moviecell.textLabel!.text = movies[indexPath.row] as? String
            return moviecell
        }
        
    }
    
    @IBAction func insert(sender: UIButton) {
        movies.addObject(UITextView_movie.text)
        UITableView_movie.reloadData()
    }
    
    
    //設定滑動後顯示紅色刪除按鈕
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView == UITableView_ball {
            return UITableViewCellEditingStyle.None
        } else {
            return UITableViewCellEditingStyle.Delete
        }
        
    }
    
    //按下刪除按鈕, 刪除該儲存格資料
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == UITableView_ball {
        
        } else {
            
            movies.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
    }
    
    @IBAction func valueChange(sender: UISwitch) {
        if sender.on {
            self.UITableView_movie.editing = true
        } else {
            self.UITableView_movie.editing = false
        }
    }
    
    //允許拖曳
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if tableView == UITableView_ball {
            return false
        } else {
            return true
        }
    }
    
    //移動資料
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        movies.exchangeObjectAtIndex(sourceIndexPath.row, withObjectAtIndex: destinationIndexPath.row)
    }
}
