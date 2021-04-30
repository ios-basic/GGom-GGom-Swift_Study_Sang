//
//  AppDelegate.swift
//  TabBar
//
//  Created by 유저 on 2021/04/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 1) 루트 뷰 컨트롤러를 UITabBarController로 캐스팅한다.
        if let tbC = self.window?.rootViewController as? UITabBarController {
          // 2) 탭 바로부터 탭 바 아이템 배열을 가져온다.
          if let tbItems = tbC.tabBar.items {
            // 3) 탭 바 아이템에 커스텀 이미지를 등록한다.
            tbItems[0].image = UIImage(named: "calendar")
            tbItems[1].image = UIImage(named: "file-tree")
            tbItems[2].image = UIImage(named: "photo")
        
        // 4) 탭 바 아이템에 타이틀을 설정한다.
        tbItems[0].title = "calendar"
        tbItems[1].title = "file"
        tbItems[2].title = "photo"
          }
        }
        return true
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}
