//
//  APIResponse.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import Foundation

/**
 A class which stores data retreived from the Corona API
 */

struct Corona: CoronaData, Decodable {
    var confirmed: Int
    var deaths: Int
    var recovered: Int
    var country: String
    var province: String?
    var name: String
}


class APIResponse: Decodable {
    let data: CoronaData
        
    enum CodingKeys: String, CodingKey {
        case data
    }
        
    enum DataKeys: String, CodingKey {
        case province, country, recovered, deaths, confirmed
    }
        
    required init(from decoder: Decoder) throws {
        let val = try decoder.container(keyedBy: CodingKeys.self)
        data = try val.decode(Corona.self, forKey: .data)
    }
}

