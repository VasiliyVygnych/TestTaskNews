//
//  NotificationsProtocols.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

protocol NotificationsAssemblerProtocol: AnyObject {
    
    func createNotificationsItems(coordinator: NotificationsCoordinatorProtocol) -> UIViewController
}

protocol NotificationsCoordinatorProtocol: AnyObject {
    
    func showNotificationsItems(tab: UITabBarController) -> UIViewController
}
