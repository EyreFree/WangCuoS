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
    
    @IBOutlet weak var previewImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.previewImageList = Array()
        for (var i = 1; ; ++i) {
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return previewImageList.count / 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("previewcell", forIndexPath: indexPath)
        let imageView:UIImageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = previewImageList[indexPath.section * 3]
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        previewImgView.image = previewImageList[indexPath.section * 3]
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    @IBAction func selectBtnClick(sender: AnyObject) {
        NSLog("Select!")
    }
}