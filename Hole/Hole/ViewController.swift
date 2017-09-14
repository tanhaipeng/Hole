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
var FirstLoad = true
var FeedApi = ""


class ViewController: UIViewController,UITableViewDataSource{
    
    @IBOutlet var FeedTable: UITableView!
    
    // 刷新控制器
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
    
    
    public func refreshData() {
        // 从缓存加载数据
        if FirstLoad {
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








