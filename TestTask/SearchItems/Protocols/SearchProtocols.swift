//
//  SearchProtocols.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

protocol SearchAssemblerProtocol: AnyObject {
    func createSearchItems(coordinator: SearchCoordinatorProtocol) -> UIViewController
    
}
protocol SearchCoordinatorProtocol: AnyObject {
    func showSearchItems(tab: UITabBarController) -> UIViewController
}
