//
//  DetailPresenter.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {
        
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var coordinator: HomeCoordinatorProtocol?
    
    func viewDidLoad() {
        if let data = interactor?.data {
            view?.setData(data: data)
        }
    }
    func backToView() {
        coordinator?.popToRoot()
    }
}
extension DetailPresenter: DetailInteractorOutputProtocol {

}
