//
//  YResponseModel.swift
//  MoyaLearn
//
//  Created by apple on 2021/12/23.
//

import Foundation

struct YResponseModel: Codable {
    let data: String
    
    enum CodingKeys: String, CodingKey {
        // key 映射
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode(String.self, forKey: .data)
    }
}
