//
//  FifthViewController.swift
//  UI_Swift
//
//  Created by 林金龍 on 2015/8/14.
//  Copyright (c) 2015年 林金龍. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController, mydelegate {
    @IBOutlet weak var UITextField_segue1: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 實作委派取得Sixth View傳遞的資料 text
    func myfunc(controller: SixthViewController, text: String) {
        self.UITextField_segue1.text = text
    }

    // 頁面切換
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 比對是否按下 toSixthViewSegue
        if segue.identifier == "toSixthViewSegue" {
            let vc = segue.destinationViewController as! SixthViewController
            vc.data = self.UITextField_segue1.text
            vc.delegate = self
        }
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
