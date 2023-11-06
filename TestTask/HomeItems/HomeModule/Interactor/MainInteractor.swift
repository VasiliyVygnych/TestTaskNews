//
//  MainInteractor.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit

class MainInteractor: MainInteractorInputProtocol {
  
    weak var presenter: MainInteractorOutputProtocol?
    var network: MainNetworkProtocol?
    var model: DocsData?
    
    func getData() {
        network?.requestData(completion: { [ weak self ] data in
            DispatchQueue.main.async {
                self?.model = data
                self?.presenter?.dataTransmission(data: data?.result.items)
            }
        })
    }
    
    func getNewData() {
        guard let model = model else { return }
        network?.requestNewData(lastId: model.result.lastID,
                          lastSortingValue: model.result.lastSortingValue,
                          completion: { [ weak self ] data in
            DispatchQueue.main.async {
                self?.model = data
                guard let models = data?.result.items else { return }
                self?.presenter?.transmissionNewData(data: models)
            }
        })
    }
}
