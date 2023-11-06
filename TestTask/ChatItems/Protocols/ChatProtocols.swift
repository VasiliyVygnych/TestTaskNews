//
//  ChatProtocols.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

protocol ChatAssemblerProtocol: AnyObject {
    
    func createChatItems(coordinator: ChatCoordinatorProtocol) -> UIViewController
}

protocol ChatCoordinatorProtocol: AnyObject {
    
    func showChatItems(tab: UITabBarController) -> UIViewController
}
