//
//  Netwokr.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import UIKit

class Netwokr: MainNetworkProtocol {
    
    func requestData(completion: @escaping (DocsData?) -> Void) {
        var components = URLComponents(string: "https://api.dtf.ru/v2.4/feed")
        components?.queryItems = [URLQueryItem(name: "",
                                               value: ""),
                                  URLQueryItem(name: "",
                                               value: "")]
        guard let url = components?.url else { return }
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { [weak self ]
                (data, response, error) in
                guard let _ = self,
                      let data = data else { return }
                guard let song = try?
                        JSONDecoder().decode(DocsData.self,
                                             from: data) else { return }
                let model = song
                completion(model)
            }
        task.resume()
    }
    func requestNewData(lastId: Int,
                  lastSortingValue: Double,
                  completion: @escaping (DocsData?) -> Void) {
        var components = URLComponents(string: "https://api.dtf.ru/v2.4/feed")
        components?.queryItems = [URLQueryItem(name: "lastId",
                                               value: "\(lastId)"),
                                  URLQueryItem(name: "lastSortingValue",
                                               value: "\(lastSortingValue)")]
        guard let url = components?.url else { return }
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { [weak self ]
                (data, response, error) in
                guard let _ = self,
                      let data = data else { return }
                guard let song = try?
                        JSONDecoder().decode(DocsData.self,
                                             from: data) else { return }
                let model = song
                completion(model)
            }
        task.resume()
    }
}
