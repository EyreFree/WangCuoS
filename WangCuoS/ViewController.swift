//
//  ViewController.swift
//  WangCuoS
//
//  Created by Venpoo on 15/7/31.
//  Copyright © 2015年 EyreFree. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var btn_l_1: UIRoundButton!
    @IBOutlet var btn_l_2: UIRoundButton!
    @IBOutlet var btn_l_3: UIRoundButton!
    @IBOutlet var btn_r_1: UIRoundButton!
    @IBOutlet var btn_r_2: UIRoundButton!
    @IBOutlet var btn_r_3: UIRoundButton!
    @IBOutlet var btn_xiao: UIRoundButton!
    @IBOutlet var btn_da: UIRoundButton!
    
    @IBOutlet var rongQi: UIView!
    var touchView: UITrajectoryView!
    
    var touchMark:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn_l_1.initUIRoundButton(UIColor(red: 242.0/255.0, green: 246.0/255.0, blue: 247.0/255.0, alpha: 1.0),
            colorSelected: UIColor(red: 242.0/255.0, green: 246.0/255.0, blue: 247.0/255.0, alpha: 1.0))
        btn_l_1.setCheckState(true)
        btn_l_2.initUIRoundButton(UIColor(red: 241.0/255.0, green: 69.0/255.0, blue: 69.0/255.0, alpha: 1.0),
            colorSelected: UIColor(red: 241.0/255.0, green: 69.0/255.0, blue: 69.0/255.0, alpha: 1.0))
        btn_l_2.setCheckState(false)
        btn_l_3.initUIRoundButton(UIColor(red: 66.0/255.0, green: 128.0/255.0, blue: 255.0/255.0, alpha: 1.0),
            colorSelected: UIColor(red: 66.0/255.0, green: 128.0/255.0, blue: 255.0/255.0, alpha: 1.0))
        btn_l_3.setCheckState(false)
        
        btn_r_1.initUIRoundButton(UIImage(named: "橡皮按钮（未选中）")!,imageSelected: UIImage(named: "橡皮按钮（已选中）")!)
        btn_r_1.setCheckState(true)
        btn_r_2.initUIRoundButton(UIImage(named: "笔刷按钮（未选中）")!,imageSelected: UIImage(named: "笔刷按钮（已选中）")!)
        btn_r_2.setCheckState(false)
        btn_r_3.initUIRoundButton(UIImage(named: "橡皮按钮（未选中）")!,imageSelected: UIImage(named: "橡皮按钮（已选中）")!)
        btn_r_3.setCheckState(false)
        
        btn_xiao.initUIRoundButton(UIColor(red: 242.0/255.0, green: 246.0/255.0, blue: 247.0/255.0, alpha: 1.0),
            colorSelected: UIColor(red: 242.0/255.0, green: 246.0/255.0, blue: 247.0/255.0, alpha: 1.0))
        btn_xiao.setLineWidth(1, bian2: 2, margin: 3)
        btn_da.initUIRoundButton(UIColor(red: 242.0/255.0, green: 246.0/255.0, blue: 247.0/255.0, alpha: 1.0),
            colorSelected: UIColor(red: 242.0/255.0, green: 246.0/255.0, blue: 247.0/255.0, alpha: 1.0))
        btn_da.setLineWidth(1, bian2: 2, margin: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        let testImage:UIImage = UIImage(named: "a")!
        let testSize:CGSize = createSize(CGRectMake(0, 0, rongQi.bounds.width - 20, rongQi.bounds.height - 20), targetSize: testImage.size)
        touchView = UITrajectoryView(frame: CGRectMake(0 , 0, testSize.width, testSize.height))
        touchView.initTrajectoryView(0.3, blur: 0.1, isCover: false, image: testImage)
        touchView.setBackgroundImage(UIImage(named: "b")!)
        touchView.setSuperController(self)
        touchView.setSuanfaPathImage()
        
        btn_l_1.refresh()
        btn_l_2.refresh()
        btn_l_3.refresh()
        btn_r_1.refresh()
        btn_r_2.refresh()
        btn_r_3.refresh()
        btn_xiao.refresh()
        btn_da.refresh()
        
        self.view.addSubview(touchView)
        touchView.center = rongQi.center
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touchMark = false
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if (touchMark) {
            btn_r_3.setCheckState(true)
            btn_r_3.refresh()
        } else {
            touchMark = true
        }
    }
    
    func createSize(usableRect:CGRect, targetSize:CGSize)->CGSize {
        var width:CGFloat = 0, height:CGFloat = 0
        let usableSize:CGSize = CGSize(width: usableRect.width, height: usableRect.height)
        
        let targetScale:CGFloat = targetSize.width / targetSize.height
        let usableScale:CGFloat = usableSize.width / usableSize.height
        
        if (targetScale > usableScale) {
            width = usableSize.width
            height = CGFloat(Int(usableSize.width / targetScale))
        } else {
            width = CGFloat(Int(usableSize.height * targetScale))
            height = usableSize.height
        }
        
        return CGSize(width: width, height: height)
    }
    
    //擦除背景
    @IBAction func caChuBeiJing(sender: AnyObject) {
        touchView.setTouchState(false)
        btn_r_1.setCheckState(true)
        btn_r_2.setCheckState(false)
        btn_r_1.refresh()
        btn_r_2.refresh()
    }
    
    //恢复背景
    @IBAction func huiFuBeiJing(sender: AnyObject) {
        touchView.setTouchState(true)
        btn_r_1.setCheckState(false)
        btn_r_2.setCheckState(true)
        btn_r_1.refresh()
        btn_r_2.refresh()
    }
    
    //撤销一次
    @IBAction func cheXiao(sender: AnyObject) {
        touchView.clearLastOne()
        //touchView.clearView()
        btn_r_3.setCheckState(false)
        btn_r_3.refresh()
    }
    
    //颜色一
    @IBAction func yanse_1(sender: AnyObject) {
        changeBgColor(1)
    }
    
    //颜色二
    @IBAction func yanse_2(sender: AnyObject) {
        changeBgColor(2)
    }
    
    //颜色三
    @IBAction func yanse_3(sender: AnyObject) {
        changeBgColor(3)
    }
    
    func changeBgColor(count:Int) {
        switch (count) {
        case 1:
            touchView.setBackgroundImage(UIImage(named: "b")!)
            btn_l_1.setCheckState(true)
            btn_l_2.setCheckState(false)
            btn_l_3.setCheckState(false)
            break
        case 2:
            touchView.setBackgroundImage(touchView.createGradientImageWithColor(UIColor(red: 255/255.0, green: 64/255.0, blue: 64/255.0, alpha: 1)))
            btn_l_1.setCheckState(false)
            btn_l_2.setCheckState(true)
            btn_l_3.setCheckState(false)
            break
        case 3:
            touchView.setBackgroundImage(touchView.createGradientImageWithColor(UIColor(red: 64/255.0, green: 64/255.0, blue: 255/255.0, alpha: 1)))
            btn_l_1.setCheckState(false)
            btn_l_2.setCheckState(false)
            btn_l_3.setCheckState(true)
            break
        default:
            break
        }
        touchView.refresh()
        btn_l_1.refresh()
        btn_l_2.refresh()
        btn_l_3.refresh()
    }
    
    //该变刷子大小
    @IBAction func changeSlider(sender: AnyObject) {
        let control:UISlider = sender as! UISlider
        touchView.setTouchWidth(CGFloat(control.value))
    }
}