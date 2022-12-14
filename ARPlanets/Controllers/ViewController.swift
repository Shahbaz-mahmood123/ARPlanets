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


    @IBOutlet weak var selectPlanetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        // Show statistics such as fps and timing information
       // sceneView.showsStatistics = true
        
        //Debug mode
//        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
      
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
        
        let planetModel = Planets()
        if let touchLocation = touches.first?.location(in: sceneView){
            
            guard let query = sceneView.raycastQuery(from: touchLocation, allowing: .existingPlaneInfinite, alignment: .any) else {return}
            
            let results = sceneView.session.raycast(query)
            
            if let hitResult = results.first {
                print(hitResult)
                //This gets the planet selection from UserDefaults and sets it if it is a null value. This value is set on the PlanetViewController.
                if let currentPlanet = userDefaults.object(forKey: UserDefaultsConstants.currentPlanetSelection) as? String {
                    planetModel.currentPlanet = currentPlanet

                } else {
                    userDefaults.set("Earth Daytime", forKey: UserDefaultsConstants.currentPlanetSelection)
                }
                

                let node = planetModel.createPlanetNode(atLocation: hitResult)
                
                if planetModel.currentPlanet == "moon"{
                    node.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
                } else{
                    node.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
                    node.physicsField = SCNPhysicsField.linearGravity()
                }
                
                planetArray.append(node)
                sceneView.scene.rootNode.addChildNode(node)
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
        
        gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/MilkyWay.jpeg")
        
        plane.materials = [gridMaterial]
        
        planeNode.geometry = plane
        //planeNode.physicsField = SCNPhysicsField.vortex()
        
        return planeNode
    }
    
    @IBAction func selectPlanet(_ sender: Any) {
        navigationController?.pushViewController(swiftUIController, animated: true)
        
    }
    @IBAction func removeLastObject(_ sender: UIBarButtonItem) {
        removeLastPlanet()
    }
    
    @IBAction func takeScreenshot(_ sender: Any) {
    
        let image = sceneView.snapshot()
        let arImageModel = ARImageModel()
        arImageModel.image = image
        let ImageUIController = UIHostingController(rootView: ARImageView(imageModel: arImageModel))
        
        
        navigationController?.pushViewController(ImageUIController, animated: true)
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
  


