//
//  API.swift
//  XDSwift
//
//  Created by DHF on 2020/4/5.
//  Copyright © 2020 XiaoDing. All rights reserved.
//

struct API {
    static let baseUrl = "http://m2.qiushibaike.com/"
    
    // 列表
    static let imgrank = url(path: "article/list/imgrank")
    
    
    
    
    static func url(path: String) ->String {
        return baseUrl + path
    }
}
