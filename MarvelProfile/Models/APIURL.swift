//
//  APIURL.swift
//  MarvelProfile
//
//  Created by Eduardo Jordan on 1/3/21.
//

import Foundation
import CryptoSwift

class ApiURL{
    
    static let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static let pathCharacters = "/characters?"
    static let limit =  20//100
    static private let privateKey = Constants.API_KEY_PRIVATE
    static private let publicKey = Constants.API_KEY_PUBLIC
    
    static func getCredentials() -> String{
        let ts = Date().timeIntervalSince1970.description
        let hash = "\(ts)\(privateKey)\(publicKey)".md5()
        let authParams = ["ts": ts, "apikey": publicKey, "hash": hash]
        return authParams.queryString!
    }
    
}
