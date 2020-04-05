//
//  DiscoverViewController.swift
//  LvkeSwift
//
//  Created by DHF on 2020/4/4.
//  Copyright © 2020 XiaoDing. All rights reserved.
//

import UIKit
import SwiftyJSON
import KakaJSON

class DiscoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "发现"
        
        self.view.backgroundColor = RGBColor(r:34,g:54,b:34);
        
        let dict = ["page" : "1"]
        HttpDatas.shareInstance.requestDatas(.get, URLString: API.imgrank, paramaters: dict, finishCallBack: { response in
            let jsons = JSON(response)["items"].arrayObject
            
            print("respon -- :", jsons as Any)
        }) { (error) in
            print("error -- :", error)
        }
    }
}
