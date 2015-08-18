//
//  HotelTableViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/8/17.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class HotelTableViewController: UITableViewController,HttpProtocol {

    var eHttp:HttpController = HttpController() // AJAX讀取網頁
    var allData:Array<HotelSingle> = [] // 存所有資料
    var selectedHotel:Int = 0 // 使用者選取的旅館
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        eHttp.delegate = self // 設定HttpController代理
        eHttp.onSearch("http://data.taipei.gov.tw/opendata/apply/query/Mzk2MjQ2OEMtN0FBOS00OUY0LTk2NUEtNUVDMzBDRTI3MkUz") // 讀取JSON資料
    }

    // 實作協定方法
    func didReceiveResults(results:NSArray) {
        // 建立所有資料陣列
        for dict:AnyObject in results { // results 是 JSON 資料
            var hotelSingle = HotelSingle(dict: dict as! NSDictionary)
            allData.append(hotelSingle)
        }
        self.tableView.reloadData() // 重新顯示資料
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return allData.count
    }

    //顯示分區名稱及旅館數
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.textLabel!.text = allData[indexPath.row].name
        cell.detailTextLabel?.text = allData[indexPath.row].tel + " " + allData[indexPath.row].display_addr

        return cell
    }
    
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath {
        selectedHotel = indexPath.row
        return indexPath
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        var destViewController:HotelMapViewController = segue.destinationViewController as! HotelMapViewController
        var hotelSingle = allData[selectedHotel]
        destViewController.hotelName = hotelSingle.name // 傳送旅館名稱
        destViewController.hotelAddr = hotelSingle.display_addr // 傳送旅館地址
    }
    

}
