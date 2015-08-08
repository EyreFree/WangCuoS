//
//  MainController.swift
//  WangCuoS
//
//  Created by EyreFree on 15/8/6.
//  Copyright © 2015年 EyreFree. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnStart(sender: AnyObject) {
        /*let newVC:TouchController = TouchController.new()
        self.presentViewController(newVC, animated: false, completion: nil)*/
        NSLog("start!")
    }
    
    @IBAction func btnAbout(sender: AnyObject) {
        //关于按钮:打开链接
        UIApplication.sharedApplication().openURL(NSURL(string: "http://eyrefree.org")!)
    }
    
    @IBAction func btnQuit(sender: AnyObject) {
        //退出按钮:向中心渐变消失
        let window:UIWindow = ((UIApplication.sharedApplication().delegate?.window)!)!
        window.opaque = true
        window.backgroundColor = UIColor.clearColor()
        UIView.animateWithDuration(0.25, animations: {
            window.alpha = 0
            window.frame = CGRectMake(window.bounds.size.width / 2, window.bounds.size.height / 2, 0, 0)
            }, completion: {
                void in exit(0)
            }
        )
    }
}