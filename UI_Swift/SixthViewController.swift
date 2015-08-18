//
//  SixthViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/8/14.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

// 建立協議
protocol mydelegate{
    // 定義方法
    func myfunc(controller:SixthViewController, text:String)
}

class SixthViewController: UIViewController {

    // 建立委派物件
    var delegate:mydelegate? = nil
    var data:String? //建立屬性
    
    @IBOutlet weak var UITextField_segue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 取得Fifth View傳遞的資料
        self.UITextField_segue.text = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func UIButton_toFifthView(sender: UIButton) {
        // 按下返回Fifth View 執行委派
        if (delegate != nil) {
            delegate!.myfunc(self,text:self.UITextField_segue.text)
        }
        //結束頁面
        self.dismissViewControllerAnimated(true, completion:nil)
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
