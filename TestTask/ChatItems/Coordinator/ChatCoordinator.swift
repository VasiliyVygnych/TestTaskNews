//
//  ChatCoordinator.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

class ChatCoordinator: ChatCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    var assembler: ChatAssemblerProtocol
    init(assembler: ChatAssemblerProtocol = ChatAssembler(),
         navigationController: UINavigationController) {
        self.assembler = assembler
        self.navigationController = navigationController
    }
    
    func showChatItems(tab: UITabBarController) -> UIViewController {
        let view = assembler.createChatItems(coordinator: self)
        view.tabBarItem = UITabBarItem(title: "",
                                       image: UIImage(named: "BellTabBar"),
                                       tag: 2)
        return view
    }
}
