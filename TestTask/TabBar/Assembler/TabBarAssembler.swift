//
//  TabBarAssembler.swift
//  TestTask
//
//  Created by maryana sorokina on 26.10.2023.
//

import UIKit

class TabBarAssembler: TabBarAssemblerProtocol {
    
    func createTabBar(coordinator: CoordinatorProtocol) -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        tabBar.tabBar.tintColor = UIColor(named: "redColor")
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        return tabBar
    }
}
