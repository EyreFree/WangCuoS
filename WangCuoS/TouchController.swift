//
//  TouchController.swift
//  WangCuoS
//
//  Created by EyreFree on 15/7/31.
//  Copyright © 2015年 EyreFree. All rights reserved.
//

import UIKit

class TouchController: UIViewController {
    @IBOutlet weak var rongQi: UIView!
    var touchView: UITrajectoryView!
    
    var touchMark:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        let testImage:UIImage = UIImage(named: "a1_back")!
        let testSize:CGSize = createSize(
            CGRectMake(0, 0, rongQi.bounds.width - 20, rongQi.bounds.height - 20),
            targetSize: testImage.size
        )
        touchView = UITrajectoryView(frame: CGRectMake(0 , 0, testSize.width, testSize.height))
        touchView.initTrajectoryView(0.3, blur: 0.1, isCover: false, image: testImage)
        touchView.setBackgroundImage(UIImage(named: "a1_fore")!)
        touchView.setSuperController(self)
        
        self.view.addSubview(touchView)
        touchView.center = rongQi.center
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touchMark = false
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if (touchMark) {
            
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
    }
    
    //恢复背景
    @IBAction func huiFuBeiJing(sender: AnyObject) {
        touchView.setTouchState(true)
    }
    
    //撤销一次
    @IBAction func cheXiao(sender: AnyObject) {
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
            break
        case 2:
            touchView.setBackgroundImage(touchView.createGradientImageWithColor(
                UIColor(red: 255/255.0, green: 64/255.0, blue: 64/255.0, alpha: 1))
            )
            break
        case 3:
            touchView.setBackgroundImage(touchView.createGradientImageWithColor(
                UIColor(red: 64/255.0, green: 64/255.0, blue: 255/255.0, alpha: 1))
            )
            break
        default:
            break
        }
        touchView.refresh()
    }
    
    //该变刷子大小
    @IBAction func changeSlider(sender: AnyObject) {
        let control:UISlider = sender as! UISlider
        touchView.setTouchWidth(CGFloat(control.value))
    }
}