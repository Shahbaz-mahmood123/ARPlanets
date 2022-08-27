//
//  ViewController.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-11.
//

import UIKit
import SceneKit
import ARKit
import SwiftUI

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    //private var currentPlanetSelection: String?
    private var planetArray = [SCNNode]()
    
    private let userDefaults = UserDefaults.standard
    
    private let swiftUIController = UIHostingController(rootView: PlanetCollectionView())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        

        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
        
        //let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
      
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var planetModel = Planets()
        if let touchLocation = touches.first?.location(in: sceneView){
            
            guard let query = sceneView.raycastQuery(from: touchLocation, allowing: .existingPlaneInfinite, alignment: .any) else {return}
            
            let results = sceneView.session.raycast(query)
            
            if let hitResult = results.first {
                
                //This gets the planet selection from UserDefaults and sets it if it is a null value. This value is set on the PlanetViewController.
                
                if let currentPlanet = userDefaults.object(forKey: "currentPlanetSelection") as? String {
                    planetModel.currentPlanet = currentPlanet
                } else {
                    userDefaults.set("Earth Daytime", forKey: "currentPlanetSelection")
                }
                let node = planetModel.createPlanetNode(atLocation: hitResult)
                
                planetArray.append(node)
                
                sceneView.scene.rootNode.addChildNode(node)
                
                node.runAction(
                    SCNAction.rotateBy(x: CGFloat(80), y: CGFloat(80), z: CGFloat(0.0), duration: 3600))
            }
        }
    }
    
    //MARK: - ARSCNViewDelegateMethods
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard let planeAnchor = anchor as? ARPlaneAnchor else{return}
        
        let planeNode = createPlane(withPlaneAnchor: planeAnchor)
        
        node.addChildNode(planeNode)
        
    }
    
    func createPlane(withPlaneAnchor planeAnchor: ARPlaneAnchor) -> SCNNode{
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        
        let planeNode = SCNNode()
        
        planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
        
        let gridMaterial = SCNMaterial()
        
        gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
        
        plane.materials = [gridMaterial]
        
        planeNode.geometry = plane
        
        return planeNode
    }
    
    @IBAction func selectPlanet(_ sender: Any) {
        navigationController?.pushViewController(swiftUIController, animated: true)
        
    }
    @IBAction func removeLastObject(_ sender: UIBarButtonItem) {
        removeLastPlanet()
        
    }
    
    func removeLastPlanet(){
        let planetsWithIndex = planetArray.enumerated()
        if !planetArray.isEmpty{
            for (index, planet) in planetsWithIndex{
                if index == planetArray.count - 1 {
                    planet.removeFromParentNode()
                    planetArray.removeLast()
                }
            }
        }
    }
    
    func removeAllPlanets(){
        if !planetArray.isEmpty{
            for planet in planetArray{
                planet.removeFromParentNode()
            }
        }
    }
    
    
}
  


