//
//  TodoModel.swift
//  Todo
//
//  Created by tanhaipeng on 2017/9/9.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var id:String
    var image:String
    var title:String
    var date:Date
    
    init (id:String,image:String,title:String,date:Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
    
}

// 无需init，类为引用(修改)，struct拷贝成本高
struct TodoModel2 {
    var id:String
    var image:String
    var title:String
    var date:NSDate
}
