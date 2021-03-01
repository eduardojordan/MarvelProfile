//
//  Extensions.swift
//  MarvelProfile
//
//  Created by Eduardo Jordan on 1/3/21.
//

import Foundation

extension Dictionary {
    var queryString: String? {
        return self.reduce("") { "\($0!)\($1.0)=\($1.1)&" }
    }
}
