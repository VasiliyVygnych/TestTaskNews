//
//  MainAssembler.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit

class HomeAssembler: HomeAssemblerProtocol {
    
    func createMainModule(coordinator: HomeCoordinatorProtocol) -> UITableViewController {
        let viewController = MainViewController()
        let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
        let interactor: MainInteractorInputProtocol = MainInteractor()
        let network: MainNetworkProtocol = Netwokr()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.network = network
        return viewController
    }
    func createDetailModule(model: ResultItem?,
                            coordinator: HomeCoordinatorProtocol) -> UIViewController {
        let viewController = DetailViewController()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol = DetailInteractor()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.data = model
        return viewController
    }
    func createImageView(model: ResultItem?,
                   coordinator: HomeCoordinatorProtocol) -> UIViewController{
        let viewController = ImageViewController()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol = DetailInteractor()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        interactor.data = model
        return viewController
    }
}
