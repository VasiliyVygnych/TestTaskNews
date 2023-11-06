//
//  TabBarProtocols.swift
//  TestTask
//
//  Created by maryana sorokina on 26.10.2023.
//

import UIKit

protocol TabBarAssemblerProtocol: AnyObject {
    
    func createTabBar(coordinator: CoordinatorProtocol) -> UITabBarController
}

protocol CoordinatorProtocol {
    
    func start()
}
