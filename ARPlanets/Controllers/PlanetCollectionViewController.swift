//
//  PlanetCollectionViewController.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-12.
//

import UIKit

private let reuseIdentifier = "Cell"

class PlanetCollectionViewController: UICollectionViewController {
    
    private var planetsList = [String]()
    private var planet = Planets()
    private var currentPlanetSelection: String = ""
    private var userDefaults = UserDefaults.standard
  
    
    private var isSelected = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        planetsList = ["Mars", "Earth Clouds", "moon"]
        
        collectionView?.backgroundColor = .systemBackground

        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PlanetCell")

    }



    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return planetsList.count
//    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? PlanetCollectionViewCell {
            
            currentPlanetSelection = planetsList[indexPath.row]
            print(currentPlanetSelection)
            userDefaults.set(currentPlanetSelection, forKey: "currentPlanetSelection")            
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return planetsList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        //need to actually handle in case of error and not return empty cell.
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetCollectionViewCell{
            cell.configure(with: planetsList[indexPath.row])
            cell.backgroundColor = .systemRed
            
            
            return cell
            
        }
        
        
        
        return cell
    
        
    }



}

