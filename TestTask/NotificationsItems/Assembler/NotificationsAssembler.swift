//
//  NotificationsAssembler.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

class NotificationsAssembler: NotificationsAssemblerProtocol {
    
    func createNotificationsItems(coordinator: NotificationsCoordinatorProtocol) -> UIViewController {
        let viewController = NotificationsViewController()
        
        return viewController
    }
}

