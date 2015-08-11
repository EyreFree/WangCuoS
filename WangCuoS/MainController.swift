//
//  MainController.swift
//  WangCuoS
//
//  Created by EyreFree on 15/8/6.
//  Copyright © 2015年 EyreFree. All rights reserved.
//


import UIKit

class MainController: UIViewController {
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var aboutBtn: UIButton!
    @IBOutlet weak var quitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置背景图片
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_1.jpg")!)
        
        //设置按钮图片:TODO
        startBtn.setImage(UIImage(named: "btn_start_s"), forState: UIControlState.Reserved)
        aboutBtn.setImage(UIImage(named: "btn_about_s"), forState: UIControlState.Selected)
        quitBtn.setImage(UIImage(named: "btn_quit_s"), forState: UIControlState.Selected)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //开始按钮:进入图片选择列表
    @IBAction func btnStart(sender: AnyObject) {
    }
    
    //关于按钮:打开链接
    @IBAction func btnAbout(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://eyrefree.org")!)
    }
    
    //退出按钮:向中心渐变消失
    @IBAction func btnQuit(sender: AnyObject) {
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