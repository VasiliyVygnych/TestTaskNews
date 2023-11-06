//
//  ProfileCoordinator.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

class ProfileCoordinator: ProfileCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    var assembler: ProfileAssemblerProtocol
    init(assembler: ProfileAssemblerProtocol = ProfileAssembler(),
         navigationController: UINavigationController) {
        self.assembler = assembler
        self.navigationController = navigationController
    }
    
    func showNotificationsItems(tab: UITabBarController) -> UIViewController {
        let view = assembler.createProfileItems(coordinator: self)
        view.tabBarItem = UITabBarItem(title: "",
                                       image: UIImage(named: "profileImage"),
                                       tag: 4)
        return view
    }
}
