//
//  DiscoverViewController.swift
//  LvkeSwift
//
//  Created by DHF on 2020/4/4.
//  Copyright © 2020 XiaoDing. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "发现"
        
        self.view.backgroundColor = RGBColor(r:34,g:54,b:34);
        
        let dict = ["token" : "f2e0c88f-7d32-3464-9cc5"]
        HttpDatas.shareInstance.requestDatas(.get, URLString: "https://apis.jiao-yuan.com/api/202/travel_diary_v2.php/member_unreadmsg_cnt_v2", paramaters: dict, finishCallBack: { (respon) in
            print("respon -- :", respon)
        }) { (error) in
            print("error -- :", error)
        }
    }
}
