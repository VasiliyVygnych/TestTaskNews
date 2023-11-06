//
//  AppDelegate.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder,
                    UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: CoordinatorProtocol?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        let homeItems: HomeCoordinatorProtocol = HomeCoordinator(navigationController: navController)
        let searchItems: SearchCoordinatorProtocol = SearchCoordinator(navigationController: navController)
        let chatItems: ChatCoordinatorProtocol = ChatCoordinator(navigationController: navController)
        let notifications: NotificationsCoordinatorProtocol = NotificationsCoordinator(navigationController: navController)
        let profile: ProfileCoordinatorProtocol = ProfileCoordinator(navigationController: navController)
        coordinator = TabBarCoordinator(navigationController: navController,
                                        homeItems: homeItems,
                                        searchItems: searchItems,
                                        chatItems: chatItems,
                                        notifications: notifications,
                                        profile: profile)
            coordinator?.start()
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        return true
    }
}
