//
//  MainPresenter.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit

class MainPresenter: MainPresenterProtocol {
        
    weak var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var coordinator: HomeCoordinatorProtocol?
    
    func viewDidLoad() {
        interactor?.getData()
    }
    func addData() {
        interactor?.getNewData()
    }
    func didSelectRowAt(data: ResultItem?) {
        guard let view = view else { return }
        coordinator?.showDetail(view: view,
                                model: data)
    }
    func didSelectImage(data: ResultItem?) {
            guard let view = view else { return }
            coordinator?.showImage(view: view,
                                   model: data)
    }
}
extension MainPresenter: MainInteractorOutputProtocol {
    func dataTransmission(data: [ResultItem]?) {
        view?.setData(data: data)
    }
    func transmissionNewData(data: [ResultItem]?) {
        view?.setNewData(data: data)
    }
}
