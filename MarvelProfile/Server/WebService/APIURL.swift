//
//  APIURL.swift
//  MarvelProfile
//
//  Created by Eduardo Jordan on 1/3/21.
//

import Foundation
import CryptoSwift
import UIKit

class ApiURL  {
    
    static let shared = ApiURL()
    
     var page = 0
     let basePath = "https://gateway.marvel.com/v1/public/characters?"
     let pathCharacters = "/characters?"
     var limit =  100 //100
     private let privateKey = Constants.API_KEY_PRIVATE
     private let publicKey = Constants.API_KEY_PUBLIC

    
    func getCredentials() -> String {
        let ts = Date().timeIntervalSince1970.description
        let hash = "\(ts)\(privateKey)\(publicKey)".md5()
        let authParams = ["ts": ts, "apikey": publicKey, "hash": hash]
        return authParams.queryString!
    }

    
}
