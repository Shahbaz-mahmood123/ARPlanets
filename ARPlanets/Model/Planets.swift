//
//  Planets.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-12.
//

import Foundation
import SceneKit
import ARKit


struct Planets {
    
    var currentPlanet: String = "moon"
    
    private var radius: CGFloat?
    private let material = SCNMaterial()
    private var planetBackgroundImage:UIImage {
        get{
            //This is to so we can return the correct asset based of the users selection. currentplanet should be update in VC
            return UIImage(named: "art.scnassets/\(currentPlanet).jpeg")!
        }
        
    }
    

    //creates sphere to be used to create planets
    //@Returns -> SCNSphere object to be used to assign to a node and create a planet
    mutating func createPlanet() -> SCNSphere? {
        setRadius()
        if let planetRadius = radius {
            let sphere = SCNSphere(radius: planetRadius)
            print(planetRadius)
            material.diffuse.contents = planetBackgroundImage
                            
            sphere.materials = [material]
            return sphere
        }
        
        return nil
    }
    //Maybe this could be a computed property?
    mutating func setRadius(){
        switch currentPlanet {
        case "moon":
            radius = 0.01
        case "earth":
           radius = 0.05
        case "Sun":
            radius = 0.1
        default: radius = 0.05
        }
    }
    
    //put the roation of the node here
    mutating func rotation(){
        
    }
    // creates the node and adds the position based of the users results
    //@Parameters:ARRaycastResult, this is so we can set the x, y and z value before placing the image
    //@Returns SCNode object to be used in VC
    mutating func createPlanetNode(atLocation location: ARRaycastResult) -> SCNNode {
        let node = SCNNode()
        
        guard let newPlanet = createPlanet() else{ fatalError("unable to create planet")}
        
        
        node.geometry = newPlanet
        node.position = SCNVector3(
            x: location.worldTransform.columns.3.x,
            y: location.worldTransform.columns.3.y + newPlanet.boundingSphere.radius,
            z: location.worldTransform.columns.3.z)
        
        //planetArray.append(node)
        return node
    }
}
