//
//  YRequester.swift
//  MoyaLearn
//
//  Created by whaley on 2021/12/20.
//

import Foundation
import Alamofire
import Moya

class YRequester {
    
    static let shared = YRequester()
    
    func primeRequest(with urlString: String, completion: ((YResponseModel) -> Void)?) {
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
            
            if let model = self.handleResponseData(data) {
                completion?(model)
            }
        }
        task.resume()
    }
    
    func alamofireRequest(with urlString: String, completion: ((YResponseModel) -> Void)?) {
        AF.request(urlString).response { response in
            if let model = self.handleResponseData(response.data) {
                completion?(model)
            }
        }
    }
    
    func moyaRequest(with urlString: String, completion: ((YResponseModel) -> Void)?) {
        let provider = MoyaProvider<MyService>()
        provider.request(.localhost) { result in
            switch result {
            case .success(let response):
                if let model = self.handleResponseData(response.data) {
                    completion?(model)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func handleResponseData(_ data: Data?) -> YResponseModel? {
        
        guard let data = data else { return nil }
        
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode(YResponseModel.self, from: data)
            return model
        } catch {
            print(error)
            return nil
        }
    }
}
