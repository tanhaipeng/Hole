//
//  ViewController.swift
//  LoveFinder
//
//  Created by tanhaipeng on 2017/9/6.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!

    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var hightNumber: UISlider!
    
    @IBOutlet weak var hight: UILabel!
    
    @IBOutlet weak var hasHouse: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 点击事件
    @IBAction func onClick(_ sender: Any) {
        let genderText = gender.selectedSegmentIndex==0 ? "高富帅":"白富美"
        //let calendar = Calendar.current
        //let component = calendar.dateComponents([1,12,1990], from: Date())
        
        let house = hasHouse.isOn ? "有房":"无房"
        result.text = "\(name.text!),\(genderText),\(house),\(hight.text!)"
        
    }
    
    // 滑动事件
    @IBAction func onChanged(_ sender: Any) {
        let slider = sender as! UISlider
        let h = Int(slider.value)
        slider.value = Float(h)
        hight.text = "\(h)厘米"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

