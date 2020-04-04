//
//  TabBar.swift
//  LvkeSwift
//
//  Created by DHF on 2020/4/4.
//  Copyright © 2020 XiaoDing. All rights reserved.
//

import UIKit

class TabBar: UITabBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        //修改TabBar文字、图片位置（向上移动两个像素）
        for button in subviews where button is UIControl {
            var frame = button.frame
            frame.origin.y = -2
            button.frame = frame
        }
    }
}
