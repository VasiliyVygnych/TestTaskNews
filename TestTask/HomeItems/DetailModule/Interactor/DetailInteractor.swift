//
//  DetailInteractor.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit

class DetailInteractor: DetailInteractorInputProtocol {
    
    weak var presenter: DetailInteractorOutputProtocol?
    
    var data: ResultItem?
    
}
