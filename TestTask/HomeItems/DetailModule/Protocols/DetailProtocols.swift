//
//  DetailProtocols.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }

    func setData(data: ResultItem)
}

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var coordinator: HomeCoordinatorProtocol? { get set }
    
    func backToView()
    func viewDidLoad()
}

protocol DetailInteractorInputProtocol: AnyObject {
    var presenter: DetailInteractorOutputProtocol? { get set }
    
    var data: ResultItem? { get set }
}

protocol DetailInteractorOutputProtocol: AnyObject {
    
}
