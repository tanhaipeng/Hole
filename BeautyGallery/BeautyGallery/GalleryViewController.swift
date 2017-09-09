//
//  GalleryViewController.swift
//  BeautyGallery
//
//  Created by AllinGo on 2017/9/7.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit
import Social

class GalleryViewController: UIViewController {
    
    
    @IBOutlet weak var pics: UIImageView!
    
    
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let name = imageName {
            pics.image = UIImage(named: name)
            switch name {
            case "fangbingbing":
                navigationItem.title = "范冰冰"
            case "wangfei":
                navigationItem.title = "王菲"
            case "libingbing":
                navigationItem.title = "李冰冰"
            case "zhouxu":
                navigationItem.title = "周迅"
            case "yangmi":
                navigationItem.title = "杨幂"
            default:
                navigationItem.title = ""
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func shareClicked(_ sender: Any) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
        
        controller.setInitialText("一起来玩~")
        controller.add(pics.image)
        self.present(controller, animated: true, completion: nil)
    }
    
}
