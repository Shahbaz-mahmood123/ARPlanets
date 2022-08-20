//
//  PlanetCollectionViewCell.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-19.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var PlanetName: UILabel!
    
    var currentPlanet: String = ""
    
    func configure(with planetName: String){
        

    }
    
    func selectBackgroundImage(){
//        planetImage.clipsToBounds = true
//        switch currentPlanet {
//        case "moon":
//            planetImage.image = UIImage(named: "art.scnassets/moon.jpeg")
//        case "earth":
//            planetImage.image = UIImage(named: "art.scnassets/Earth Daytime.jpeg")
//        case "Sun":
//            planetImage.image = UIImage(named: "art.scnassets/Sun.jpeg")
//        default: planetImage.image = UIImage(named: "art.scnassets/moon.jpeg")
//        }
    }
    
}
