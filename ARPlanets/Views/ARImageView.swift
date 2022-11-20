//
//  ARImageView.swift
//  ARPlanets
//
//  Created by Shahbaz Mahmmod on 2022-11-19.
//

import SwiftUI

struct ARImageView: View {
    @ObservedObject var imageModel = ARImageModel()
    var body: some View {
        ZStack{
            Image(uiImage: imageModel.image)
        }
    }
}

struct ARImageView_Previews: PreviewProvider {
    static var previews: some View {
        ARImageView()
    }
}
