//
//  BWTabbarViewController.swift
//  BWCustomTabbar
//
//  Created by bairdweng on 2020/10/23.
//

import UIKit
protocol BWTarBarControllerDelegate : NSObjectProtocol {
     func mcTabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
}

class BWTabbarViewController: UITabBarController,UITabBarControllerDelegate {
    var mcTabBar = BWTabbar(frame: CGRect.zero)
    weak var mcDelegate : BWTarBarControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        mcTabBar.centerBtn.addTarget(self, action: #selector(centerBtnAction), for: .touchUpInside)
        // 自定义的tabbar替换为本身的tabbar
        self.setValue(mcTabBar, forKeyPath: "tabBar")
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        mcTabBar.centerBtn.isSelected = (tabBarController.selectedIndex == (viewControllers?.count)!/2)
        self.mcDelegate?.mcTabBarController(tabBarController, didSelect: viewController)
    }
    // 中间按钮点击
    @objc func centerBtnAction() {
        let count = viewControllers?.count ?? 0
        self.selectedIndex = count/2 // 关联中间按钮
        self.tabBarController(self, didSelect: viewControllers![selectedIndex])
    }

}
