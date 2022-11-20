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
            VStack{
                Button("test") {
                    UIImageWriteToSavedPhotosAlbum(imageModel.image, nil, nil, nil)
                }

            }
        }.background{
            Image(uiImage: imageModel.image).aspectRatio( contentMode: .fit)
        }
    }
}

struct ARImageView_Previews: PreviewProvider {
    static var previews: some View {
        ARImageView()
    }
}
