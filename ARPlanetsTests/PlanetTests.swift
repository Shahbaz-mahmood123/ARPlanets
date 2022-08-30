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

    func test_creating_planet_node_should_return_SCNNode(){
        
    }
    
    func test_should_set_radius_for_specific_planet(){
        
    }
}
