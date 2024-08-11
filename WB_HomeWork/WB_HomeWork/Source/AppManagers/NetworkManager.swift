//
//  NetworkManager.swift
//  WB_HomeWork
//
//  Created by Мария Изюменко on 11.08.2024.
//

import Foundation

class NetworkManager {
    
    func getRequest(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: completion)
        task.resume()
    }
    
    func postRequest(url: URL, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
    
    func putRequest(url: URL, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = body
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
    
    func deleteRequest(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
}
