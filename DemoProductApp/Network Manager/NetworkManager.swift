//
//  NetworkManager.swift
//  DemoProductApp
//
//  Created by Hajra Masood on 27/01/2025.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://fakestoreapi.com"
    
    private init() {}
    
    func get<T: Codable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        let url = baseURL + endpoint
        guard let url = URL(string: url) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 500, userInfo: nil)))
                return
            }
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
}
