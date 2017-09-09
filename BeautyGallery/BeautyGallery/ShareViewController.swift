//
//  ShareViewController.swift
//  BeautyGallery
//
//  Created by AllinGo on 2017/9/8.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit
import Social

class ShareViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebook(_ sender: Any) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        controller.setInitialText("facebook")
        //self.presentedViewController(controller,animate
        self.present(controller, animated: true, completion: nil)

    }
    
    @IBAction func twitter(_ sender: Any) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        controller.setInitialText("twitter")
        //self.presentedViewController(controller,animate
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func weibo(_ sender: Any) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeSinaWeibo)
        controller.setInitialText("weibo")
        //self.presentedViewController(controller,animate
        self.present(controller, animated: true, completion: nil)
    }
    
}
