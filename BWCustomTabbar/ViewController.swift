//
//  ViewController.swift
//  BWCustomTabbar
//
//  Created by bairdweng on 2020/10/23.
//

import UIKit

class ViewController: BWTabbarViewController,BWTarBarControllerDelegate {
    func mcTabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("hello")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //选中时的颜色
        mcTabBar.tintColor = UIColor(red: 251.0/255.0, green: 199.0/255.0, blue: 115.0/255.0, alpha: 1)
        //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
        mcTabBar.isTranslucent = false
        mcTabBar.positon = .bulge
        mcTabBar.centerImage = UIImage(named: "tabbar_add_yellow")!
        
        
        addChildViewControllers()
        // Do any additional setup after loading the view.
    }

    //添加子控制器
    func addChildViewControllers() {
        //图片大小建议32*32
        addChildViewController(UIViewController(), title: "首页", imageName: "tab1")
        addChildViewController(UIViewController(), title: "应用", imageName: "tab2")
        //中间这个不设置东西，只占位
        addChildViewController(UIViewController(), title: "发布", imageName: "")
        addChildViewController(UIViewController(), title: "消息", imageName: "tab3")
        addChildViewController(UIViewController(), title: "我的", imageName: "tab4")
    }
    
    // 添加子vc
    func addChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        childController.title = title
        if imageName.count > 0{
            childController.tabBarItem.image = UIImage(named: imageName)
            childController.tabBarItem.selectedImage = UIImage(named: imageName)
        }
        let nav = UINavigationController(rootViewController: childController)
        addChild(nav)
    }
    
}

