//
//  PlanetCollectionViewModel.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-24.
//

import Foundation


class PlanetCollectionViewModel: ObservableObject{
    
    @Published var planet = Planets()
    @Published var currentPlanetSelection: String?
    @Published var arrayOfPlanets: [PlanetList] = [
        PlanetList(name: "moon"),
        PlanetList(name: "Earth Daytime"),
        PlanetList(name: "Saturn"),
        PlanetList(name: "Mars"),
        PlanetList(name: "Venus"),
        PlanetList(name: "Uranus"),
        PlanetList(name: "Earth Nighttime"),
        PlanetList(name: "Earth Clouds"),
        PlanetList(name: "Jupiter"),
        ]
    
    private let userDefaults = UserDefaults.standard
    
    
    //this is just ne testing setting the planet to see if its possible.
    func setPlanet(_ selectedPlanet: String){
        userDefaults.set(selectedPlanet, forKey: "currentPlanetSelection")
    }
}