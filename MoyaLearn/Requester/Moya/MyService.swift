//
//  MyService.swift
//  MoyaLearn
//
//  Created by apple on 2021/12/24.
//

import Foundation
import Moya

enum MyService {
    case localhost
}

extension MyService: TargetType {
    
    var baseURL: URL {
        switch self {
        case .localhost:
            return URL(string: "http://localhost:8888/")!
        }
    }
    
    var path: String {
        switch self {
        case .localhost:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .localhost:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .localhost:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
