//
//  MainTabBarController.swift
//  LvkeSwift
//
//  Created by DHF on 2020/4/4.
//  Copyright © 2020 XiaoDing. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.barTintColor = UIColor.white
        
        addChild(title: "发现", image: "tabbar00_normal", selectedImage: "tabbar00_selected", type: DiscoverViewController.self)
        addChild(title: "游记", image: "tabbar01_normal", selectedImage: "tabbar01_selected", type: TravelNotesViewController.self)
        addChild(title: "", image: "tabbar_publish", selectedImage: "tabbar_publish", type: PublishViewController.self)
        addChild(title: "精选", image: "tabbar02_normal", selectedImage: "tabbar02_selected", type: FeaturedViewController.self)
        addChild(title: "我的", image: "tabbar03_normal", selectedImage: "tabbar03_selected", type: MineViewController.self)
    }
    
    func addChild(title: String, image: String, selectedImage: String, type: UIViewController.Type) {
        let nav = UINavigationController(rootViewController: type.init())
        nav.tabBarItem.title = title;
        nav.tabBarItem.image = UIImage(named: image);
        nav.tabBarItem.selectedImage = UIImage(named: selectedImage);
        
        //设置选中文字的颜色
        nav.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.red
        ], for: .selected)
        
        addChild(nav)
    }
}
