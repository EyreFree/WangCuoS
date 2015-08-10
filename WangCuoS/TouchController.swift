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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        let foreImage:UIImage = UIImage(named: "a1_fore")!
        touchView = UITrajectoryView(
            frame: createAutoRect(
                CGRectMake(0, 0, rongQi.bounds.width - 8, rongQi.bounds.height - 8),
                targetSize: foreImage.size
            )
        )
        touchView.initTrajectoryView(
            0.8, blur: 0.1, isCover: false,
            imageFore: foreImage, imageBack: UIImage(named: "a1_back")!
        )
        
        self.view.addSubview(touchView)
        touchView.center = rongQi.center
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
}