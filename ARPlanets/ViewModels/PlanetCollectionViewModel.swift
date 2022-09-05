//
//  PlanetCollectionViewModel.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-24.
//

import Foundation
import SwiftUI


class PlanetCollectionViewModel: ObservableObject{
    
    @Published var planet = Planets()
    @Published var currentPlanetSelection: String?
    @Published var cellcolor : Color? 
    @Published var arrayOfPlanets: [PlanetList] = [
        PlanetList(name: "moon"),
        PlanetList(name: "Earth Daytime"),
        PlanetList(name: "Saturn"),
        PlanetList(name: "Mars"),
        PlanetList(name: "Venus"),
        PlanetList(name: "Uranus"),
        PlanetList(name: "Earth Night"),
        PlanetList(name: "Earth Clouds"),
        PlanetList(name: "Jupiter"),
        PlanetList(name: "Uranus"),
        PlanetList(name: "Sun"),
        ]
    
    private let userDefaults = UserDefaults.standard
    
    
    //this is just ne testing setting the planet to see if its possible.
    func setPlanet(_ selectedPlanet: String){
        userDefaults.set(selectedPlanet, forKey: UserDefaultsConstants.currentPlanetSelection)
        print(userDefaults.object(forKey: UserDefaultsConstants.currentPlanetSelection))
    }
    //Probably should use userdefaults here to set the current planet as highlighted. 
    func setColorForCell(_ isHighlighted: Bool){
        if isHighlighted == true {
            cellcolor =  Color.red
        } else {
            cellcolor =  Color.cyan
        }
    }
}
