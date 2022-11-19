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
    @Published var isHiglighted: IsHiglighted
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
//        PlanetList(name: "Earth Clouds", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Jupiter", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
        PlanetList(name: "Sun", radius: 0.05, rotation:Rotation(x: 80, y:80, z:0.0, duration: 3600)),
    ]
    
    private let userDefaults = UserDefaults.standard
    
    init(){

        //this is really wonky I should probably add an extension to userDefaults for this maybe?
        if let currentPlanetName = userDefaults.object(forKey: UserDefaultsConstants.currentPlanetSelection) as? String {
            currentPlanetSelection = currentPlanetName
            isHiglighted = IsHiglighted(fieldName: currentPlanetName, isHighlighted: true)
        } else {
            userDefaults.set("Earth Daytime", forKey: UserDefaultsConstants.currentPlanetSelection)
            let currentPlanetName = userDefaults.object(forKey: UserDefaultsConstants.currentPlanetSelection) as! String
            currentPlanetSelection = currentPlanetName
            isHiglighted = IsHiglighted(fieldName: currentPlanetName, isHighlighted: true)
        }
        //let currentPlanetName = userDefaults.object(forKey: UserDefaultsConstants.currentPlanetSelection) as! String
        //currentPlanetSelection = currentPlanetName
    }
    
    //this is just ne testing setting the planet to see if its possible.
    func setPlanet(_ selectedPlanet: String){
        userDefaults.set(selectedPlanet, forKey: UserDefaultsConstants.currentPlanetSelection)
    }
    //Probably should use userdefaults here to set the current planet as highlighted.
    func setColorForCell(name: String){
        // unset currentplanet if one is selected
        if isHiglighted.isHighlighted == true && name == isHiglighted.fieldName{
            cellcolor =  Color.clear
        } else {
            cellcolor =  Color.white
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
                isHiglighted.fieldName = name
                isHiglighted.isHighlighted = true
            }
            setPlanet(name)
        }
        isHiglighted.fieldName = name
        
        //    func setCellToHiglightedIfPlanetIsSelected(planetName: String){
        //        //if same cell is selected set true to false
        //        //if another cell is selected update userDefaults to new planet name and keep isHiglighted value as true
        //        if isHiglighted.fieldName == planetName {
        //            isHiglighted.isHighlighted = !isHiglighted.isHighlighted
        //        }
        //        if isHiglighted.fieldName != planetName {
        //                isHiglighted.isHighlighted = true
        //                isHiglighted.fieldName = planetName
        //            setPlanet(planetName)
        //        }
        //
    }
}
