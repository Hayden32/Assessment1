//
//  PlaceController.swift
//  Assessment1
//
//  Created by Hayden Hastings on 4/1/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import Foundation

class PlaceController {
    
    static let shared = PlaceController()
    var placesArray: [Place] = []
    
    private let placeDictionaryArrayKey = "placeDictionaryArray"
    
    init() {
        loadFromPersistantStore()
    }
    
    func addPlaceWithName(name: String, reasonToGo: String) {
        let place = Place(name: name, reasonToGo: reasonToGo)
        
        placesArray.append(place)
        saveToPersistantStore()
    }
    
    func saveToPersistantStore() {
        var placeDictionaryArray: [[String: String]] = []
        
        for place in placesArray {
            let placeDictionary = place.dictionaryRepresentation
            
            placeDictionaryArray.append(placeDictionary)
        }
        UserDefaults.standard.set(placeDictionaryArray, forKey: placeDictionaryArrayKey)
    }
    
    func loadFromPersistantStore() {
        if let placeDictionaryArray = UserDefaults.standard.value(forKey: placeDictionaryArrayKey) as? [[String: String]] {
            
            var placesArray: [Place] = []
            for placeDictionary in placeDictionaryArray {
                if let place = Place(dictionary: placeDictionary) {
                    placesArray.append(place)
                }
            }
            self.placesArray = placesArray
        }
    }
}
