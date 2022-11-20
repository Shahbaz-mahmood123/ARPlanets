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
        ZStack(alignment: .topTrailing){
            VStack(alignment: .trailing){
                HStack(alignment:.top){
                    Spacer()
                    Button("Save") {
                        UIImageWriteToSavedPhotosAlbum(imageModel.image, nil, nil, nil)
                    }.padding(10)
                    
                }
                Spacer()
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
