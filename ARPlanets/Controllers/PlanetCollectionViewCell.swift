//
//  PlanetCollectionViewCell.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-19.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var PlanetCollectionImage: UIImageView!
    private var userDefaults = UserDefaults.standard

    
    func configure(with planetName: String){
        let currentPlanet = userDefaults.object(forKey: "currentPlanetSelection")
        
        PlanetCollectionImage.image = UIImage(named: "Moon.jpeg")
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
