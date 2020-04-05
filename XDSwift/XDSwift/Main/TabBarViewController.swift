//
//  TabBarViewController.swift
//  XDSwift
//
//  Created by DHF on 2020/4/5.
//  Copyright © 2020 XiaoDing. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    var indexFlag = 0; //默认选中 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置tabBarController 代理方法
        self.delegate = self
        
        // tabbar背景颜色
        tabBar.barTintColor = UIColor.white
        // 添加控制器
        addChild(DiscoverViewController(), title: "发现", image: "tabbar00_normal", selectedImage: "tabbar00_selected")
        addChild(TravelNotesViewController(), title: "游记", image: "tabbar01_normal", selectedImage: "tabbar01_selected")
        addChild(PublishViewController(), title: "", image: "tabbar_publish", selectedImage: "tabbar_publish")
        addChild(FeaturedViewController(), title: "精选", image: "tabbar02_normal", selectedImage: "tabbar02_selected")
        addChild(MineViewController(), title: "我的", image: "tabbar03_normal", selectedImage: "tabbar03_selected")
    }
    
    // 自定义tabbar对应控制器初始化方法
    func addChild(_ child: UIViewController, title: String, image: String, selectedImage: String) {
        let nav = UINavigationController(rootViewController: child)
        // item文字
        nav.tabBarItem.title = title;
        // 未选中图片
        nav.tabBarItem.image = UIImage(named: image);
        // 选中图片
        nav.tabBarItem.selectedImage = UIImage(named: selectedImage);
        
        // 选中文字的颜色
        nav.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.red
        ], for: .selected)
        
        addChild(nav)
    }
    
    // 点击item方法
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            indexFlag = index
        }
    }
    
    // 个人中心-我的，若用户未登录  提示用户先登录，不选中tabbar
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    
        print("\(indexFlag)")
        
        if indexFlag == 2 || indexFlag == 4 {
            return false
        } else {
            return true
        }
    }
}
