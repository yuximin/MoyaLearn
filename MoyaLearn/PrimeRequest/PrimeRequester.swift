//
//  PrimeRequester.swift
//  MoyaLearn
//
//  Created by whaley on 2021/12/20.
//

import Foundation

class PrimeRequester {
    
    static let shared = PrimeRequester()
    
    func request(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request with \(urlString) error: \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("Status code error")
                return
            }
            
            guard let data = data else { return }
            
            do {
                if let result = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print("Request success: \(result) \(result["data"] ?? "nil")")
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
