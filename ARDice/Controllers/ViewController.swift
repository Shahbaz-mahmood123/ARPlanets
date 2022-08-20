//
//  ViewController.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-11.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var planetArray = [SCNNode]()
    
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
        if let touchLocation = touches.first?.location(in: sceneView){
            
            guard let query = sceneView.raycastQuery(from: touchLocation, allowing: .existingPlaneGeometry, alignment: .any) else {return}
            
            let results = sceneView.session.raycast(query)
            
            if let hitResult = results.first {
                
                let node = createNode(atLocation: hitResult)
                
                sceneView.scene.rootNode.addChildNode(node)
                
                node.runAction(
                    SCNAction.rotateBy(x: CGFloat(80), y: CGFloat(80), z: CGFloat(0.0), duration: 90))
            }
            
        }
    }
    
    //put the roation of the node here
    func rotation(){
        
    }
    
    //creates sphere to be used to create planets, should take a parameter of UIImage to choose planet
    func createSphere() -> SCNSphere{
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpeg")
        
        sphere.materials = [material]
        
        return sphere
    }
    
    func createNode(atLocation location: ARRaycastResult) -> SCNNode {
        let node = SCNNode()
        
        node.geometry = createSphere()
        node.position = SCNVector3(
            x: location.worldTransform.columns.3.x,
            y: location.worldTransform.columns.3.y + createSphere().boundingSphere.radius,
            z: location.worldTransform.columns.3.z)
        
        planetArray.append(node)
        return node
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
    
    func removeLastPlanet(){
        let planetsWithIndex = planetArray.enumerated()
        if !planetArray.isEmpty{
            for (index, planet) in planetsWithIndex{
                if index == planetArray.count - 1 {
                    planet.removeFromParentNode()
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
    @IBAction func removeLastObject(_ sender: UIBarButtonItem) {
        removeLastPlanet()
        
    }
}





