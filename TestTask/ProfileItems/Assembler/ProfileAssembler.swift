//
//  ProfileAssembler.swift
//  TestTask
//
//  Created by Vasiliy Vygnych on 02.11.2023.
//

import UIKit

class ProfileAssembler: ProfileAssemblerProtocol {
    
    func createProfileItems(coordinator: ProfileCoordinatorProtocol) -> UIViewController {
        let viewController = ProfileViewController()
        
        return viewController
    }
}
