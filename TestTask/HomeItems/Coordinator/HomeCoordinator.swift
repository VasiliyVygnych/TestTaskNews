//
//  HomeCoordinator.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 26.10.2023.
//

import UIKit

class HomeCoordinator: HomeCoordinatorProtocol {

    var navigationController: UINavigationController?
    var assembler: HomeAssemblerProtocol
    init(assembler: HomeAssemblerProtocol = HomeAssembler(),
         navigationController: UINavigationController) {
        self.assembler = assembler
        self.navigationController = navigationController
    }
    func showHomeItems(tab: UITabBarController) -> UIViewController {
        let view = assembler.createMainModule(coordinator: self)
        view.tabBarItem = UITabBarItem(title: "",
                                       image: UIImage(named: "homeTabBar"),
                                       tag: 0)
        return view
    }
    func showDetail(view: MainViewProtocol,
                    model: ResultItem?) {
        if let navigationController = navigationController {
             let detailViewController = assembler.createDetailModule(model: model,
                                                                     coordinator: self)
            navigationController.pushViewController(detailViewController,
                                                    animated: true)
        }
    }
    func showImage(view: MainViewProtocol,
                   model: ResultItem?) {
        if let navigationController = navigationController {
          let imageView = assembler.createImageView(model: model,
                                                    coordinator: self)
            imageView.modalPresentationStyle = .custom
            imageView.transitioningDelegate = view as? MainViewController
            navigationController.present(imageView,
                                         animated: true)
        }
    }
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
