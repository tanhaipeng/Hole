//
//  ViewController.swift
//  BeautyGallery
//
//  Created by AllinGo on 2017/9/7.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var beautyPicker: UIPickerView!
    
    var beauties = ["范冰冰","李冰冰","王菲","杨幂","周迅"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        beautyPicker.dataSource = self
        beautyPicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToGallery"{
            let index = beautyPicker.selectedRow(inComponent: 0)
            var image:String?
            switch index{
            case 0:
                image = "fangbingbing"
            case 1:
                image = "libingbing"
            case 2:
                image = "wangfei"
            case 3:
                image = "yangmi"
            case 4:
                image = "zhouxu"
            default:
                image = nil
            }
            if let vc = segue.destination as? GalleryViewController{
                vc.imageName = image
            }
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        // 可以从上个界面将值传回
        print("second close")
    }
}

