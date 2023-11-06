//
//  SearchCoordinator.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 01.11.2023.
//

import UIKit

class SearchCoordinator: SearchCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    var assembler: SearchAssemblerProtocol
    init(assembler: SearchAssemblerProtocol = SearchAssembler(),
         navigationController: UINavigationController) {
        self.assembler = assembler
        self.navigationController = navigationController
    }
    
    func showSearchItems(tab: UITabBarController) -> UIViewController {
        let view = assembler.createSearchItems(coordinator: self)
        view.tabBarItem = UITabBarItem(title: "",
                                       image: UIImage(named: "discoverTabBar"),
                                       tag: 1)
        return view
    }
}
