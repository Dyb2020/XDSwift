//
//  Common.swift
//  XDSwift
//  宏定义参数
//  Created by DHF on 2020/4/4.
//  Copyright © 2020 XiaoDing. All rights reserved.
//

import UIKit

// 屏幕宽度
let kScreenW = UIScreen.main.bounds.width

// 屏幕高度
let kScreenH = UIScreen.main.bounds.height

// 判断是否iPhone
let kIsPhone = Bool(UIDevice.current.userInterfaceIdiom == .phone)

// 判断是否iPhoneX
let kIsPhoneX = Bool(kScreenW > 375.0 && kScreenH >= 812.0 && kIsPhone)

// 导航条高度
let kNavigationBarH = CGFloat(kIsPhoneX ? 88 : 64)

// 状态栏高度
let kStatusBarH = CGFloat(kIsPhoneX ? 44 : 20)

// tabbar高度
let kTabBarH = CGFloat(kIsPhoneX ? (49 + 34) : 49)

// KeyWindow
let KeyWindow = UIApplication.shared.windows[0]

// 自定义颜色
func RGBColor(r :CGFloat, g :CGFloat, b:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

//字号
func customFont(font: CGFloat) -> UIFont {
    // 刘海屏
    guard kScreenH <= 736 else {
        return UIFont.systemFont(ofSize: font)
    }
    // 5.5
    guard kScreenH == 736 else {
        return UIFont.systemFont(ofSize: font - 2)
    }
    // 4.7
    guard kScreenH > 736 else {
        return UIFont.systemFont(ofSize: font - 4)
    }
    
    return UIFont.systemFont(ofSize: font)
}
