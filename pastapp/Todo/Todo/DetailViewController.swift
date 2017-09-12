//
//  DetailViewController.swift
//  Todo
//
//  Created by tanhaipeng on 2017/9/9.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController, UITextViewDelegate{
    
    @IBOutlet weak var child: UIButton!
    @IBOutlet weak var plane: UIButton!
    @IBOutlet weak var shop: UIButton!
    @IBOutlet weak var tel: UIButton!
    @IBOutlet weak var todoL: UILabel!
    @IBOutlet weak var todo: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    var todoOld:TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if todoOld==nil{
            navigationItem.title = "新增todo"
            child.isSelected = true
        }else{
            navigationItem.title = "编辑todo"
            if todoOld?.image == "children_s"{
                child.isSelected = true
            }
            if todoOld?.image == "plane_s"{
                plane.isSelected = true
            }
            if todoOld?.image == "tel_s"{
                tel.isSelected = true
            }
            if todoOld?.image == "shop_s"{
                shop.isSelected = true
            }
            todo.text = todoOld?.title
            datepicker.setDate((todoOld?.date)!, animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetButton(){
        child.isSelected = false
        plane.isSelected = false
        shop.isSelected = false
        tel.isSelected = false
    }
    
    @IBAction func childClick(_ sender: Any) {
        resetButton()
        child.isSelected = true
    }
    
    @IBAction func planeClick(_ sender: Any) {
        resetButton()
        plane.isSelected = true
    }
    
    @IBAction func shopClick(_ sender: Any) {
        resetButton()
        shop.isSelected = true
    }
    
    @IBAction func telClick(_ sender: Any) {
        resetButton()
        tel.isSelected = true
    }
    
    @IBAction func okClick(_ sender: Any) {
        var image = ""
        if child.isSelected {
            image = "children_s"
        }
        if plane.isSelected {
            image = "plane_s"
        }
        if shop.isSelected {
            image = "shop_s"
        }
        if tel.isSelected {
            image = "tel_s"
        }
        if todoOld == nil{
        let uuid = NSUUID.init().uuidString
        var todo = TodoModel(id:uuid,image:image,title:self.todo.text!,date:datepicker.date)
        todos.append(todo)
        }else{
            todoOld?.image = image
            todoOld?.title = todo.text!
            todoOld?.date = datepicker.date
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        todo.resignFirstResponder()
    }
}
