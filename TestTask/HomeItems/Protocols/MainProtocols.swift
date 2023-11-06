//
//  MainProtocols.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
    
    func setData(data: [ResultItem]?)
    func setNewData(data: [ResultItem]?)
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var coordinator: HomeCoordinatorProtocol? { get set }

    func viewDidLoad()
    func addData()
    func didSelectRowAt(data: ResultItem?)
    func didSelectImage(data: ResultItem?)
}

protocol MainInteractorInputProtocol: AnyObject {
    var presenter: MainInteractorOutputProtocol? { get set }
    var network: MainNetworkProtocol? { get set }
    var model: DocsData? { get set }
    
    func getData()
    func getNewData()
}

protocol MainInteractorOutputProtocol: AnyObject {
    
    func dataTransmission(data: [ResultItem]?)
    func transmissionNewData(data: [ResultItem]?)
}

protocol HomeAssemblerProtocol: AnyObject {
    
    func createMainModule(coordinator: HomeCoordinatorProtocol) -> UITableViewController
    func createDetailModule(model: ResultItem?,
                            coordinator: HomeCoordinatorProtocol) -> UIViewController
    func createImageView(model: ResultItem?,
                   coordinator: HomeCoordinatorProtocol) -> UIViewController
}

protocol HomeCoordinatorProtocol: AnyObject {
    func showHomeItems(tab: UITabBarController) -> UIViewController
    func showDetail(view: MainViewProtocol,
                    model: ResultItem?)
    func popToRoot()
    func showImage(view: MainViewProtocol,
                         model: ResultItem?)
}

protocol MainNetworkProtocol: AnyObject {
    func requestData(completion: @escaping (DocsData?) -> Void)
    func requestNewData(lastId: Int,
                        lastSortingValue: Double,
                        completion: @escaping (DocsData?) -> Void)
}
