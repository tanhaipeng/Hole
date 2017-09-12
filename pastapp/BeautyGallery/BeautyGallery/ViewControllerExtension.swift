//
//  ViewControllerExtension.swift
//  BeautyGallery
//
//  Created by AllinGo on 2017/9/7.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit


// 静态信息
extension ViewController:UIPickerViewDataSource{
    
    // 返回Components个数
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // 返回View个数
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return beauties.count
    }
}


// 动作方法
extension ViewController:UIPickerViewDelegate{
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return beauties[row]
    }
}
