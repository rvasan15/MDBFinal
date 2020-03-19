//
//  APIManager.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import Foundation

/**
 A class containing static methods to make API calls
 */
class APIManager {
    static let BASE_STRING  = "https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats"
    
    /**
     A static method which makes an API call to retrieve data from the API. It passes this data
     to the caller via the provided completion method.
     */
    static func retrieveData(for country: String?, completion: @escaping ([ProvinceData]) -> ()) {
        // Part 1C
        guard let url = URL(string: BASE_STRING) else {
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            print(String(describing: error))
            return
        }
        
        let request = try! JSONDecoder().decode(APIResponse.self, from: data)
        completion((request.data as! [ProvinceData]))
    }
    task.resume()
    }

}
