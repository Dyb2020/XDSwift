//
//  HttpDatas.swift
//  XDSwift
//  网络请求封装
//  Created by DHF on 2020/4/5.
//  Copyright © 2020 XiaoDing. All rights reserved.
//

import UIKit
import Alamofire // 网络请求

private let httpShareInstance = HttpDatas()

// 数据请求方法
enum MethodType {
    case get
    case post
}

class HttpDatas: NSObject {
    // 单例
    class var shareInstance: HttpDatas {
        return httpShareInstance
    }
}

extension HttpDatas {
    /**
     * type : 数据请求方式 get / post
     * URLString : 数据请求路径
     * paramaters : 请求数据需要的参数
     * finishCallBack : 请求成功后通过该block数据回调
     * failreCallBlock : 请求失败后通过该block数据回调
     */
    func requestDatas (_ type:  MethodType, URLString: String, paramaters: [String: Any]?, finishCallBack: @escaping (_ respone : Any) -> (), failreCallBlock: @escaping (_ error: Error) -> ()) {
        
        // 获取请求类型
        let method = (type == .get ? HTTPMethod.get : HTTPMethod.post)
        
        // 发送网络请求
        Alamofire.request(URLString, method: method, parameters: paramaters, encoding: URLEncoding.default, headers: nil).responseJSON { responseJson in
            
            // 判断是否请求成功
            guard responseJson.result.value != nil else {
                print(responseJson.result.error!)
                failreCallBlock(responseJson.result.error!)
                return
            }
            
            // 获取结果
            guard responseJson.result.isSuccess else {
                return
            }
            
            // 成功后将请求的数据回调
            if let value = responseJson.result.value {
                finishCallBack(value)
            }
        }
    }
}
