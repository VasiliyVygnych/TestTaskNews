//
//  ProfileProtocols.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

protocol ProfileAssemblerProtocol: AnyObject {
    
    func createProfileItems(coordinator: ProfileCoordinatorProtocol) -> UIViewController
}

protocol ProfileCoordinatorProtocol: AnyObject {
    
    func showNotificationsItems(tab: UITabBarController) -> UIViewController
}
