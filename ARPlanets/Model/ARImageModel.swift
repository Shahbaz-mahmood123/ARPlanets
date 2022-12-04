//
//  ARImageModel.swift
//  ARPlanets
//
//  Created by Shahbaz Mahmmod on 2022-11-19.
//

import Foundation
import UIKit


class ARImageModel: ObservableObject {
    @Published var image = UIImage()
    @Published var isHidden = true
}
