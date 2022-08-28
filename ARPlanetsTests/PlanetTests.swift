//
//  PlanetTests.swift
//  ARDiceTests
//
//  Created by Shahbaz Mahmmod on 2022-08-28.
//

import XCTest
import ARKit


class PlanetTests: XCTestCase{
    
    func test_planet_creation_should_return_SCNSphere(){
        var planets = Planets()
        
        if let sphere = planets.createPlanet(){
            XCTAssertTrue(sphere is SCNSphere)
        }
    }
    
}
