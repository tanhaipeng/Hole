//
//  PublishViewController.swift
//  Hole
//
//  Created by tanhaipeng on 2017/9/12.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit
import Alamofire

class PublishViewController: UIViewController{
    
    @IBOutlet weak var content: UITextView!
    
    @IBAction func publish(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendChat(_ sender: Any) {
        if content.text.isEmpty {
            let alertController = UIAlertController(
                title: "提示",
                message: "匿名内容不能为空",
                preferredStyle: .alert)
            let emptyAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default,handler:nil)
            alertController.addAction(emptyAction)
            self.present(alertController, animated:true, completion: nil)
            print("chat content empty")
        }else{
            if content.text.characters.count < 15{
                let alertController = UIAlertController(
                    title: "提示",
                    message: "匿名内容至少15个字",
                    preferredStyle: .alert)
                let emptyAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default,handler:nil)
                alertController.addAction(emptyAction)
                self.present(alertController, animated:true, completion: nil)
            } else{
                self.postChat(content:content.text)
            }
        }
    }
    
    public func postChat(content:String){
        print(content)
    }
    
}








