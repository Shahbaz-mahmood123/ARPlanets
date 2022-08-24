//
//  PlanetCollectionViewModel.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-24.
//

import Foundation


class PlanetCollectionViewModel: ObservableObject{
    
    @Published var planet = Planets()
    
    private let userDefaults = UserDefaults.standard
    
    
    //this is just ne testing setting the planet to see if its possible.
    func setPlanet(){
        var test = userDefaults.object(forKey: "currentPlanetSelection")
        userDefaults.set("Sun", forKey: "currentPlanetSelection")
        var test1 = userDefaults.object(forKey: "currentPlanetSelection")
        print(test)
        print(test1)
        
    }
    
    
}
