//
//  Planets.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-12.
//

import Foundation
import SceneKit
import ARKit


class Planets {
    
    var currentPlanet: String = "moon"
    private var radius: CGFloat?
    private let material = SCNMaterial()
    private var planetBackgroundImage:UIImage {
        get{
            //This is to so we can return the correct asset based of the users selection. currentplanet should be updated in VC
            return UIImage(named: "art.scnassets/\(currentPlanet).jpeg")!
        }
        
    }
    

    //creates sphere to be used to create planets
    //@Returns -> SCNSphere object to be used to assign to a node and create a planet
    func createPlanet() -> SCNSphere? {
        setRadius()
        if let planetRadius = radius {
            let sphere = SCNSphere(radius: planetRadius)
            material.diffuse.contents = planetBackgroundImage
            sphere.materials = [material]
            
            return sphere
        }
        
        return nil
    }
    //Maybe this could be a computed property?
    func setRadius(){
        switch currentPlanet {
        case "moon":
            radius = 0.01
        case "Earth Daytime":
           radius = 0.05
        case "Sun":
            radius = 0.5
        case "Earth Night":
            radius = 0.05
        case "Neptune":
            radius = 0.03
        case "Saturn":
            radius = 0.1
        case "Uranus":
            radius = 0.08
        case "Venus":
            radius = 0.03
        case "Mars":
            radius = 0.04
        case "Juptier":
            radius = 0.09
        case "Earth Clouds":
            radius = 0.05
        default: radius = 0.05
        }
    }
    
    //Implement logic fo setting planet rotation per planet here.
    func setRotation() -> [String: CGFloat]{
    
        return ["x": 80, "y":80, "z":0.0, "duration": 3600]
    }
    
    
    //put the roation of the node here
    // creates the node and adds the position based of the users results
    //@Parameters:ARRaycastResult, this is so we can set the x, y and z value before placing the image
    //@Returns SCNode object to be used in VC
    func createPlanetNode(atLocation location: ARRaycastResult) -> SCNNode {
        let node = SCNNode()
        
        guard let newPlanet = createPlanet() else{ fatalError("unable to create planet")}
        
        
        node.geometry = newPlanet
        node.position = SCNVector3(
            x: location.worldTransform.columns.3.x,
            y: location.worldTransform.columns.3.y + newPlanet.boundingSphere.radius,
            z: location.worldTransform.columns.3.z)
        
        let planetRotation = setRotation()
        
        var x = planetRotation["x"]!
        var y = planetRotation["y"]!
        var z = planetRotation["z"]!
        var duration = planetRotation["duration"]!
        
        node.runAction(
            SCNAction.rotateBy(x: x , y: y, z: z, duration: duration))
        //planetArray.append(node)
        return node
    }
}
