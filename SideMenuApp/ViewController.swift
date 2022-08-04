//
//  SideMenuController.swift
//  SideMenuApp
//
//  Created by 住田雅隆 on 2022/03/26.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    
    var sideMenuNavigationController: SideMenuNavigationController? = nil
    @IBAction func toSideMenu(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SideMenuController",bundle: nil)
        let sideMenuVC = storyboard.instantiateViewController(identifier: "sideMenu")as! SideMenuController
        let nav = SideMenuNavigationController(rootViewController: sideMenuVC)
        nav.settings = makeSettings()
        nav.leftSide = true
        present(nav, animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
    }
    
    private func loadSettings() {
        let storyboard: UIStoryboard = UIStoryboard(name: "SideMenuController",bundle: nil)
        let sideMenuVC = storyboard.instantiateViewController(identifier: "sideMenu")as! SideMenuController
        //サイドメニューのナビゲーションコントローラを生成
        sideMenuNavigationController = SideMenuNavigationController(rootViewController: sideMenuVC)
        //設定を追加
        sideMenuNavigationController!.settings = makeSettings()
        //メニューとして追加
        SideMenuManager.default.leftMenuNavigationController = sideMenuNavigationController
        //画面端からスワイプすると遷移する
        //        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.view, forMenu: .left)
        //画面をスワイプする事で画面遷移出来る
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    private func makeSettings() -> SideMenuSettings {
        var settings = SideMenuSettings()
        
        settings.menuWidth = UIDevice.isiPad ? 300 : view.frame.width * 0.8
        //動作を指定
        settings.presentationStyle = .menuSlideIn
        //背景の透過率設定
        settings.presentationStyle.presentingEndAlpha = 0.5
        //メニューの陰影度
        settings.presentationStyle.onTopShadowOpacity = 1.5
        
        return settings
    }
}
