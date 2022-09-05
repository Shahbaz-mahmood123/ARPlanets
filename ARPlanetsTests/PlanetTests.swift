//
//  PlanetTests.swift
//  ARDiceTests
//
//  Created by Shahbaz Mahmmod on 2022-08-28.
//

import XCTest
import ARKit


class PlanetTests: XCTestCase{

    private var planets = Planets()
    
    override func setUp() {
        
    }
    
    func test_planet_creation_should_return_SCNSphere(){
        
        if let sphere = planets.createPlanet(){
            XCTAssertTrue(sphere is SCNSphere)
        }
    }
    
    func test_should_set_rotation_for_user_selected_planet(){
        
        planets.currentPlanet = "Earth Daytime"
        let earthRotation = planets.setRotation()
        
//        planets.currentPlanet = "Sun"
//        let sunRotation = planets.setRotation()
           
        XCTAssertEqual(earthRotation, ["x": 80, "y":80, "z":0.0, "duration": 3600])
//        XCTAssertEqual(sunRotation, ["x": 120, "y":120, "z":0.0, "duration": 3600])
    }
    
    func test_should_set_radius_for_selected_planet(){
        planets.currentPlanet = "Earth Daytime"
        planets.setRadius()
        let earthRadius = planets.radius
        
        XCTAssertEqual(earthRadius, 0.05)
        
    }
    
    func test_creating_planet_node_should_return_SCNNode(){
        
    }
}
