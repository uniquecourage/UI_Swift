//
//  MenuCollectionViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/8/14.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

let reuseMenuIdentifier = "cell"

class MenuCollectionViewController: UICollectionViewController {

    var imgAry = ["star.png","star.png","star.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //設定表格的數目
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return imgAry.count
    }
    
    //儲存格設定
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:MenuCollectionCustomCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseMenuIdentifier, forIndexPath: indexPath) as! MenuCollectionCustomCell
        
        // Configure the cell
        cell.UILabel_name.text = "頁面 : \(indexPath.row)"
        cell.UIImageView_image.image = UIImage(named: imgAry[indexPath.row])
        
        return cell
    }
    
    //點選儲存格的處理
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("選取 \(imgAry[indexPath.row]) 圖片(\(indexPath.row))")
        if indexPath.row == 0 {
            //"toMainView"為segue中identifier的值, 此例為選擇後跳回Main View頁面
            self.performSegueWithIdentifier("toMainView", sender: "")
        } else if indexPath.row == 1 {
            //"toFifthView"為segue中identifier的值, 此例為選擇後跳回Fifth View頁面
            self.performSegueWithIdentifier("toFifthView", sender: "")
        } else if indexPath.row == 2 {
            //"toHotelView"為segue中identifier的值, 此例為選擇後跳回Hotel View頁面
            self.performSegueWithIdentifier("toHotelView", sender: "")
        }
    }
}
