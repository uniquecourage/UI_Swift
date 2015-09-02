//
//  ReadTXTViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/9/2.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class ReadTXTViewController: UIViewController {

    @IBOutlet weak var UILabel_title: UILabel!
    
    @IBOutlet weak var UIImageView_pic: UIImageView!
    
    @IBOutlet weak var UITextView_poem: UITextView!
    
    @IBOutlet weak var UILabel_num: UILabel!
    
    @IBOutlet weak var UIStepper_select: UIStepper!
    
    var arrayTitle:Array<String> = [] //存標題
    var arrayImg:Array<String> = [] //存圖片名稱
    var arrayContent:Array<String> = [] //存內容
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var path:NSString = NSBundle.mainBundle().pathForResource("imgintro", ofType: "txt")! //取得imgintro.txt檔路徑
        var imgName = NSData(contentsOfFile: path as String) //取得檔案內容
        var imgString:String = NSString(data:imgName!, encoding:NSUTF8StringEncoding)! as String //轉換為字串
        var arrayImage = imgString.componentsSeparatedByString("\n") //以分行符號分解字串
        for var i:Int=0 ; i<arrayImage.count ; i++ {
            var arrayTem = arrayImage[i].componentsSeparatedByString(";")
            arrayImg.append(arrayTem[0])
            arrayTitle.append(arrayTem[1])
        }
        
        path = NSBundle.mainBundle().pathForResource("poem", ofType: "txt")! //取得poem.txt檔路徑
        var contentData = NSData(contentsOfFile: path as String) //取得檔案內容
        var contentString:String = NSString(data:contentData!, encoding:NSUTF8StringEncoding)! as String //轉換為字串
        arrayContent = contentString.componentsSeparatedByString("\n") //以分行符號分解字串
        
        //顯示第一筆資料
        UILabel_title.text = arrayTitle[0]
        UIImageView_pic.image = UIImage(named: arrayImg[0])
        UITextView_poem.text = arrayContent[0]
        //設定stepper元件初始值
        UIStepper_select.minimumValue = 0
        UIStepper_select.maximumValue = Double(arrayTitle.count) + 1
        UIStepper_select.value = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stepperChange(sender: UIStepper) {
        var num:Int = Int(UIStepper_select.value) //取得stepper元件值
        if num == arrayTitle.count + 1 { //若超過最後一筆則回到第一筆
            num = 1
            UIStepper_select.value = 1
        } else if num == 0 { //若倒第0筆則移到最後一筆
            num = arrayTitle.count
            UIStepper_select.value = Double(arrayTitle.count)
        }
        
        //顯示資料
        UILabel_title.text = arrayTitle[num - 1]
        UIImageView_pic.image = UIImage(named: arrayImg[num - 1])
        UITextView_poem.text = arrayContent[num - 1]
        UILabel_num.text = String(num)
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
