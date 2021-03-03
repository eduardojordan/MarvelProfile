//
//  APIService.swift
//  MarvelProfile
//
//  Created by Eduardo Jordan on 2/3/21.
//

import Foundation

    
    class APIService :  NSObject {
        
//        AJUSTAR LA LLAMADA DEL ENDPOINT
        
        
        
        let queryParams: [String: String] = ["offset": String(ApiURL.page), "limit": String(ApiURL.limit)]
////        
       // var baseUrl = ApiURL.basePath  + queryParams + ApiURL.getCredentials()
        
        private let sourcesURL = URL(string: "https://gateway.marvel.com/v1/public/characters?offset=0&limit=20&apikey=30f82da5469dc0b00aab3559f26e2047&hash=2f5a3a0a873926a07491d431a6af3528&ts=1614691458.1753469&")!
        
        func apiToGetCharacterData(completion : @escaping (Characters) -> ()){
            URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let character = try! jsonDecoder.decode(Characters.self, from: data)
                        completion(character)
                }
            }.resume()
        }
        
        
    }
    
