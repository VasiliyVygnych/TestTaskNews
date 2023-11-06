//
//  NotificationsCoordinator.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

class NotificationsCoordinator: NotificationsCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    var assembler: NotificationsAssemblerProtocol
    init(assembler: NotificationsAssemblerProtocol = NotificationsAssembler(),
         navigationController: UINavigationController) {
        self.assembler = assembler
        self.navigationController = navigationController
    }
    
    func showNotificationsItems(tab: UITabBarController) -> UIViewController {
        let view = assembler.createNotificationsItems(coordinator: self)
        view.tabBarItem = UITabBarItem(title: "",
                                       image: UIImage(named: "BellTabBar"),
                                       tag: 3)
        return view
    }
}
