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
    @Published var isHiglighted: isFieldHighlighted
    @Published var currentPlanetSelection: String
    @Published var cellcolor : Color?
    @Published var arrayOfPlanets: [PlanetList] = [
        PlanetList(name: "moon", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Earth Daytime", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Saturn", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Mars", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Venus", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Uranus", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Earth Night", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Earth Clouds", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Jupiter", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Sun", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        ]

    private let userDefaults = UserDefaults.standard
        
    init(){
        var currentPlanetName = userDefaults.object(forKey: UserDefaultsConstants.currentPlanetSelection) as! String
        currentPlanetSelection = currentPlanetName
        isHiglighted = isFieldHighlighted(fieldName: currentPlanetName, isHighlighted: true)
    }
    
    //this is just ne testing setting the planet to see if its possible.
    func setPlanet(_ selectedPlanet: String){
        userDefaults.set(selectedPlanet, forKey: UserDefaultsConstants.currentPlanetSelection)
    }
    //Probably should use userdefaults here to set the current planet as highlighted. 
    func setColorForCell(_ isHighlighted: Bool){
        // unset currentplanet if one is selected
        if isHighlighted == true {
            cellcolor =  Color.red
        } else {
            cellcolor =  Color.cyan
        }
    }
    
    func updateCurrentPlanetText() -> String{
        return userDefaults.object(forKey: UserDefaultsConstants.currentPlanetSelection) as! String
    }
    
    func setCellToHiglightedIfPlanetIsSelected(name: String){
        //if same cell is selected set true to false
        //if another cell is selected update userDefaults to new planet name and keep isHiglighted value as true
        if isHiglighted.fieldName == name {
            isHiglighted.isHighlighted = !isHiglighted.isHighlighted
        }
        
        if isHiglighted.fieldName != name {
            if isHiglighted.isHighlighted == false {
                isHiglighted.isHighlighted = true
            }
            setPlanet(name)
        }
    }
}
