//
//  FourthViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/7/30.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var UILabel_select: UILabel!
    @IBOutlet weak var UITableView_flower: UITableView!
    
    var arrFlowers:Array<Flower> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupFlowers()
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
}