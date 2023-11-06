//
//  ChatAssembler.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

class ChatAssembler: ChatAssemblerProtocol {
    
    func createChatItems(coordinator: ChatCoordinatorProtocol) -> UIViewController {
        let viewController = ChatViewController()
        return viewController
    }
    
}
