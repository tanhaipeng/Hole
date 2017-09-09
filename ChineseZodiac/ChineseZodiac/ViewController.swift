//
//  ViewController.swift
//  ChineseZodiac
//
//  Created by tanhaipeng on 2017/9/5.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var yearOfBirth: UITextField!
    
    @IBOutlet weak var image: UIImageView!
    
    let offset = 4
    
    // 点击按钮触发逻辑
    @IBAction func okTapped(_ sender: Any) {
        yearOfBirth.resignFirstResponder()
        if let year = Int(yearOfBirth.text!), year >= offset {
                let imageNumber = (year-offset) % offset + 1
                image.image = UIImage(named: String(imageNumber))
        }else{
            let imageNumber = arc4random_uniform(13)
            image.image = UIImage(named: String(imageNumber))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // textfield去焦点，键盘消失
        yearOfBirth.resignFirstResponder()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

