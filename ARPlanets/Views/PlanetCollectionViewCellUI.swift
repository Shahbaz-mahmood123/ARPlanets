//
//  PlanetCollectionViewCellUI.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-25.
//

import SwiftUI

struct PlanetCollectionViewCellUI: View {
    @State var name: String = ""
    static let column = 3
    var row =  9
    var index = 1
    
    private let width = (UIScreen.main.bounds.width/3)-20
    

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
                .frame(width: 220, height: 200).foregroundColor(Color.cyan)
            Text("\(name)").font(.largeTitle).foregroundColor(.white)
    }
}

struct PlanetCollectionViewCellUI_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCollectionViewCellUI()
    }
}
