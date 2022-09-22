//
//  Keys.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-22.
//

import Foundation


struct PlanetList: Identifiable{
    let name: String
    let id = UUID()
    let radius: Double
    let rotation: Rotation
}

struct Rotation {
    let x: Float
    let y: Float
    let z: Float
    let duration: Float
}


struct IsHiglighted {
    var fieldName: String
    var isHighlighted: Bool
}

