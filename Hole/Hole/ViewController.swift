//
//  ViewController.swift
//  Hole
//
//  Created by tanhaipeng on 2017/9/9.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit
import Alamofire

// Feeds Storage
var FeedsArray:[FeedModel] = []



class ViewController: UIViewController,UITableViewDataSource{

    @IBOutlet var FeedTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Load Feeds data
        FeedsArray = [FeedModel(profile:"portrait",nickname:"飞翔的企鹅",signature:"#百度#",microblog:"房租又涨了，魔都，房贷加房租，月月吃土\n"),
        FeedModel(profile:"tiger",nickname:"鞋城大老虎",signature:"#携程#",microblog:"每次看到一帮人狼人杀，不回家的吗\n"),
        FeedModel(profile:"bear",nickname:"维尼熊",signature:"#南京大学#",microblog:"9月10号教师节打开，哈哈 #精致Q#\n"),
        FeedModel(profile:"cat",nickname:"风清扬",signature:"#阿里巴巴#",microblog:"阿里小p7。。。。本来想出去创业，股票加工资金200w\n"),
        FeedModel(profile:"teacher",nickname:"~Candy~",signature:"#上海中学#",microblog:"享受周末☀☀☀，教师节特地给自己买了礼物\n"),
        FeedModel(profile:"gril",nickname:"棉花糖",signature:"#陆家嘴金融#",microblog:"请大家吃咖喱牛肉，立志成为中华小当家\n"),]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return FeedsArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // get cell
        let cell = self.FeedTable.dequeueReusableCell(withIdentifier: "FeedCell") as! UITableViewCell
        var FeedItem = FeedsArray[indexPath.row]
        // 控件
        var profile = cell.viewWithTag(100) as! UIImageView
        var nickname = cell.viewWithTag(101) as! UILabel
        var signature = cell.viewWithTag(102) as! UILabel
        var microblog = cell.viewWithTag(103) as! UILabel
        profile.image = UIImage(named: FeedItem.profile)
        nickname.text = FeedItem.nickname
        signature.text = FeedItem.signature
        microblog.text = FeedItem.microblog
        return cell
    }
}








