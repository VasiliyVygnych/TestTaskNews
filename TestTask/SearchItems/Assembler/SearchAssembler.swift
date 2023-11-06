//
//  SearchAssembler.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 01.11.2023.
//

import UIKit



class SearchAssembler: SearchAssemblerProtocol {
    func createSearchItems(coordinator: SearchCoordinatorProtocol) -> UIViewController {
        let viewController = SearchViewController()
        return viewController
    }
}
