//
//  TabBarCoordinator.swift
//  TestTask
//
//  Created by maryana sorokina on 26.10.2023.
//

import UIKit


class TabBarCoordinator: CoordinatorProtocol {
    
    var homeItems: HomeCoordinatorProtocol?
    var searchItems: SearchCoordinatorProtocol?
    var chatItems: ChatCoordinatorProtocol?
    var notifications: NotificationsCoordinatorProtocol?
    var profile: ProfileCoordinatorProtocol?
    
    var navigationController: UINavigationController?
    var assembler: TabBarAssemblerProtocol
    
    init(assembler: TabBarAssemblerProtocol = TabBarAssembler(),
         navigationController: UINavigationController,
         homeItems: HomeCoordinatorProtocol,
         searchItems: SearchCoordinatorProtocol,
         chatItems: ChatCoordinatorProtocol,
         notifications: NotificationsCoordinatorProtocol,
         profile: ProfileCoordinatorProtocol) {
        self.assembler = assembler
        self.navigationController = navigationController
        self.homeItems = homeItems
        self.searchItems = searchItems
        self.chatItems = chatItems
        self.notifications = notifications
        self.profile = profile
    }
    
    func start() {
        if let navigationController = navigationController {
            let tabBar = assembler.createTabBar(coordinator: self)
            guard let home = homeItems?.showHomeItems(tab: tabBar) else { return }
            guard let search = searchItems?.showSearchItems(tab: tabBar) else { return }
            guard let chat = chatItems?.showChatItems(tab: tabBar) else { return }
            guard let notifications = notifications?.showNotificationsItems(tab: tabBar) else { return }
            guard let profile = profile?.showNotificationsItems(tab: tabBar) else { return }
            tabBar.viewControllers = [home,
                                      search,
                                      chat,
                                      notifications,
                                      profile]
            navigationController.viewControllers = [tabBar]
        }
    }   
}
