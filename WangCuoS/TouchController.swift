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
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    var img_fore:UIImage?
    var img_back:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加涂抹区
        if (nil == img_fore || nil == img_back) {
            img_fore = UIImage(named: "empty_fore")!
            img_back = UIImage(named: "empty_back")!
        }
        touchView = UITrajectoryView(
            frame: createAutoRect(
                UIScreen.mainScreen().bounds,
                targetSize: img_fore!.size
            )
        )
        touchView.initTrajectoryView(
            0.8, blur: 0.1, isCover: false,
            imageFore: img_fore!, imageBack: img_back!
        )
        self.view.addSubview(touchView)
        touchView.center = CGPoint(x: UIScreen.mainScreen().bounds.width / 2.0,
            y: UIScreen.mainScreen().bounds.height / 2.0)
        
        //将关闭按钮置于顶层
        view.bringSubviewToFront(cancelBtn)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //去除 present modally 的手势
        if let gestures = self.view.gestureRecognizers as [UIGestureRecognizer]? {
            for gesture in gestures {
                self.view.removeGestureRecognizer(gesture)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createAutoRect(usableRect:CGRect, targetSize:CGSize)->CGRect {
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
        
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    @IBAction func cancelBtnClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}