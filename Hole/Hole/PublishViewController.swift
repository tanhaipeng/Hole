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
    
    
    @IBAction func publish(_ sender: Any) {
        Alamofire.request("http://127.0.0.1:8080/hole/index.php/demo/feed")
            .responseJSON { response in
                if let json = response.result.value {
                    print("JSON: \(json)")
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}








