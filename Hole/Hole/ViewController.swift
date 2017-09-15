//
//  ViewController.swift
//  Hole
//
//  Created by tanhaipeng on 2017/9/9.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit
import Alamofire
import SQLite


// Feeds Storage
var FeedsArray:[FeedModel] = []
var FirstLoad = true
var FeedApi = ""
var DbPath = ""


class ViewController: UIViewController,UITableViewDataSource{
    
    @IBOutlet var FeedTable: UITableView!
    
    // 刷新控制器
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DbPath = NSHomeDirectory() + "/Documents/hole.sqlite"
        
        // 初始化数据
        self.execFirstInstall()
        
        // 获取服务端接口
        let infoDictionary = Bundle.main.infoDictionary
        if let infoDictionary = infoDictionary {
            let apis = infoDictionary["ApplicationApis"] as! Dictionary<String, String>
            FeedApi = apis["feed"] as! String
        }
        
        // 添加刷新
        refreshControl.addTarget(self, action: #selector(ViewController.refreshData),
                                 for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新数据")
        FeedTable.addSubview(refreshControl)
        refreshData()
        
    }
    
    public func execFirstInstall() {
        if !(UserDefaults.standard.bool(forKey: "everLaunched")) {
            UserDefaults.standard.set(true, forKey: "everLaunched")
            self.insertDefaultData()
        }
    }
    
    public func insertDefaultData() {
        do {
            // connect
            let db = try Connection(DbPath)
            let feed = Table("Feed")
            // create
            let id = Expression<Int64>("id")
            let profile = Expression<String?>("profile")
            let nickname = Expression<String>("nickname")
            let signature = Expression<String>("signature")
            let microblog = Expression<String>("microblog")
            let timestamp = Expression<Int64>("timestamp")
            try db.run(feed.create(ifNotExists: true) { t in
                t.column(id, primaryKey: true)
                t.column(profile)
                t.column(nickname)
                t.column(signature)
                t.column(microblog)
                t.column(timestamp)
            })
            let now = Date()
            let timeInterval:TimeInterval = now.timeIntervalSince1970
            let timeStamp = Int(timeInterval)
            var insert = feed.insert(profile <- "portrait", nickname <- "飞翔的企鹅", signature <- "#百度#", microblog <- "房租又涨了，魔都，房贷加房租，月月吃土", timestamp <- Int64(timeStamp))
            try db.run(insert)
            
            insert = feed.insert(profile <- "tiger", nickname <- "鞋城大老虎", signature <- "#携程#", microblog <- "每次看到一帮人狼人杀，不回家的吗", timestamp <- Int64(timeStamp))
            try db.run(insert)
            insert = feed.insert(profile <- "bear", nickname <- "维尼熊", signature <- "#南京大学#", microblog <- "9月10号教师节打开，哈哈 #精致Q#", timestamp <- Int64(timeStamp))
            try db.run(insert)
            insert = feed.insert(profile <- "cat", nickname <- "风清扬", signature <- "#阿里巴巴#", microblog <- "马云和蔡崇信将出售至多2,150万股阿里巴巴股份", timestamp <- Int64(timeStamp))
            try db.run(insert)
            insert = feed.insert(profile <- "teacher", nickname <- "~Candy~", signature <- "#上海中学#", microblog <- "享受周末☀☀☀，教师节特地给自己买了礼物", timestamp <- Int64(timeStamp))
            try db.run(insert)
            insert = feed.insert(profile <- "gril", nickname <- "棉花糖", signature <- "#陆家嘴#", microblog <- "请大家吃咖喱牛肉，立志成为中华小当家", timestamp <- Int64(timeStamp))
            try db.run(insert)
            print("Init SQLite Success")
        }catch{
            print("Init SQLite Error")
        }
    }
    
    public func refreshData() {
        // 从缓存加载数据
        if FirstLoad {
            do{
                let db = try Connection(DbPath)
                for row in try db.prepare("SELECT * FROM Feed") {
                    FeedsArray.append(FeedModel(profile:row[1] as! String,nickname:row[2] as! String,signature:row[3] as! String,microblog:row[4] as! String))
                }
            }catch{
                print("SQLite query error")
            }
            FirstLoad = false
        }
        
        // 从网络加载数据
        Alamofire.request(FeedApi)
            .responseJSON { response in
                if let json = response.result.value {
                    if  (json as? [[String : AnyObject]]) != nil{
                        if let dictionaryArray = json as? Array<Dictionary<String, AnyObject?>> {
                            if dictionaryArray.count > 0 {
                                for i in 0..<dictionaryArray.count{
                                    let Object = dictionaryArray[i]
                                    if let profile = Object["profile"] as? String, let nickname = Object["nickname"] as? String,
                                        let signature = Object["signature"] as? String, let microblog = Object["microblog"] as? String {
                                        FeedsArray.insert(FeedModel(profile:profile,nickname:nickname,signature:signature,microblog:microblog), at: i)
                                    }
                                }
                            }
                        }
                    }
                }
        }
        
        // 刷新列表
        self.FeedTable.reloadData()
        self.refreshControl.endRefreshing()
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








