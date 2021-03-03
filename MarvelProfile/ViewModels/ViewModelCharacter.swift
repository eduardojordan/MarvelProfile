//
//  ViewModelCharacter.swift
//  MarvelProfile
//
//  Created by Eduardo Jordan on 1/3/21.
//

import Foundation

class ViewModelCharacter {
    
    var refreshData = { () -> () in }
    
    var characterData : [DataCharacter] = [] {
        didSet {
            refreshData()
        }
    }
    
    func retrieveData() {
        let apiService = APIService()
        apiService.apiToGetCharacterData { (results) in
            self.characterData = results.data!.results
            
        }
    }
    
    
}

