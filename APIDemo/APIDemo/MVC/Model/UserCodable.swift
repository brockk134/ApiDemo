//
//  UserCodable.swift
//  APIDemo
//
//  Created by brockk on 8/25/18.
//  Copyright © 2018 yoyo. All rights reserved.
//

import Foundation


struct  UserCodable: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
    
//    enum CodingKeys: String, CodingKey {
//        case userId // = "" //custom keys
//        case id // = "" //custom keys
//        case title // = "" //custom keys
//        case completed //= "" //custom keys
//    }
}
