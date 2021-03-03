//
//  APIService.swift
//  MarvelProfile
//
//  Created by Eduardo Jordan on 2/3/21.
//

import Foundation
import UIKit


class APIService :  NSObject {
    
    static let queryParams: [String: String] = ["offset": String(ApiURL.shared.page), "limit": String(ApiURL.shared.limit)]
    
    let sourcesURL = URL(string: ApiURL.shared.basePath + queryParams.queryString! + ApiURL.shared.getCredentials())
    
    func apiToGetCharacterData(completion : @escaping (Characters) -> ()){
        URLSession.shared.dataTask(with: sourcesURL!) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let character = try! jsonDecoder.decode(Characters.self, from: data)
                completion(character)
            }
        }.resume()
    }
    
    
}

