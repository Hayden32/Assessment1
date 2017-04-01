//
//  File.swift
//  Assessment1
//
//  Created by Hayden Hastings on 4/1/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import Foundation

class Place {
    
    private let nameKey = "name"
    private let reasonToGoKey = "reasonToGo"
    
    let name: String
    let reasonToGo: String
    
    init(name: String, reasonToGo: String) {
        self.name = name
        self.reasonToGo = reasonToGo
    }
    
    var dictionaryRepresentation: [String: String] {
        let dictionary = [nameKey: name, reasonToGoKey: reasonToGo]
        return dictionary
    }
    
    init?(dictionary: [String: String]) {
        guard let name = dictionary[nameKey],
            let reasonToGo = dictionary[reasonToGoKey] else { return nil }
        
        self.name = name
        self.reasonToGo = reasonToGo
    }
    
}
