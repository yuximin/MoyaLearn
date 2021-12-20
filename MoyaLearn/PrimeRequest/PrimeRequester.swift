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
            print("Request success: \(data)")
        }
        task.resume()
    }
}
