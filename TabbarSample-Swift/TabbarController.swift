//
//  TabbarController.swift
//  TabbarSample-Swift
//
//  Created by XJIMI on 2017/8/14.
//  Copyright © 2017年 Vidol. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc :AppleMusicViewController = AppleMusicViewController()
        self.createVC(vc, title: "Music", imageName: "tabBar_home")

        let vc2 :StoreViewController = StoreViewController()
        self.createVC(vc2, title: "發現", imageName: "tabBar_discover")

        let vc3 :ViewController = ViewController()
        self.createVC(vc3, title: "Shake", imageName: "tabBar_shake")

        let vc4 :ViewController = ViewController()
        self.createVC(vc4, title: "訂單", imageName: "tabBar_order")

        let vc5 :ViewController = ViewController()
        self.createVC(vc5, title: "我的", imageName: "tabBar_owner")

        //self.tabBar.tintColor = UIColor.red
        self.tabBar.barTintColor = UIColor.white
    }

    private func createVC(_ vc: UIViewController, title: String, imageName: String)
    {
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName)?.withRenderingMode(.automatic)

        let navc :UINavigationController = UINavigationController(rootViewController: vc)
        self.addChildViewController(navc)
    }

}
