//
//  User.swift
//  APIDemo
//
//  Created by brockk on 8/25/18.
//  Copyright © 2018 yoyo. All rights reserved.
//

import Foundation


class User : NSObject {
    
    var userId: Int!
    var id: Int!
    var title: String!
    var isCompleted: Bool!
    
    
    
    override init() {
        super.init()
    }

    init(dict: [String: AnyObject]) {
        self.userId = dict["userId"] as! Int
        self.id = dict["id"] as! Int
        self.title = dict["title"] as! String
        self.isCompleted = dict["completed"] as! Bool
    }
    
}

