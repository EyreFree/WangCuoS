//
//  TableController.swift
//  WangCuoS
//
//  Created by EyreFree on 15/8/6.
//  Copyright © 2015年 EyreFree. All rights reserved.
//


import UIKit

class TableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var previewImageList:Array<UIImage>!
    var previewImageIndex:Int = 0
    
    @IBOutlet weak var previewImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //加载图片
        self.previewImageList = Array()
        for (var i = 1; ; i += 1) {
            let tryImgPre:UIImage? = UIImage(named: "a\(i)")
            let tryImgFore:UIImage? = UIImage(named: "a\(i)_fore")
            let tryImgBack:UIImage? = UIImage(named: "a\(i)_back")
            if (nil == tryImgPre || nil == tryImgFore || nil == tryImgBack) {
                break
            }
            self.previewImageList.append(tryImgPre!)
            self.previewImageList.append(tryImgFore!)
            self.previewImageList.append(tryImgBack!)
        }
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
    
    //TableView相关
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return previewImageList.count / 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UIScreen.mainScreen().bounds.width / 10.0 * 3.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("previewcell", forIndexPath: indexPath)
        let imageView:UIImageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = previewImageList[indexPath.section * 3]
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        previewImageIndex = indexPath.section
        previewImgView.image = previewImageList[previewImageIndex * 3]
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    //按钮事件
    @IBAction func selectBtnClick(sender: AnyObject) {
        
    }
    
    @IBAction func cancelBtnClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //跳转准备工作
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == nil) {
            return
        }
        
        let dest:UIViewController? = segue.destinationViewController
        if (NSComparisonResult.OrderedSame == segue.identifier?.compare("table2touch")) {
            dest?.setValue(previewImageList[previewImageIndex * 3 + 1], forKey: "img_fore")
            dest?.setValue(previewImageList[previewImageIndex * 3 + 2], forKey: "img_back")
        }
    }
}
