//
//  FeedModel.swift
//  Hole
//
//  Created by tanhaipeng on 2017/9/10.
//  Copyright © 2017年 tanhaipeng. All rights reserved.
//

import UIKit



class FeedModel: NSObject {
    var profile:String
    var nickname:String
    var signature:String
    var microblog:String
    
    init(profile:String,nickname:String,signature:String,microblog:String) {
        self.profile = profile
        self.nickname = nickname
        self.signature = signature
        self.microblog = microblog
    }
}
