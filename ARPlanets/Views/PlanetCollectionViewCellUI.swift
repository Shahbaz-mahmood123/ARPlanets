//
//  PlanetCollectionViewCellUI.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-25.
//

import SwiftUI

struct PlanetCollectionViewCellUI: View {
    @State var name: String = ""
    @ObservedObject var vm = PlanetCollectionViewModel()
    @State var isHiglighted = false
    //@State var currentColor = Color.cyan
    private let width = (UIScreen.main.bounds.width/3)-20
    
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 8)
                .frame(width: 220, height: 200).foregroundColor(vm.cellcolor ?? Color.cyan)
            Text("\(name)").font(.largeTitle).foregroundColor(.white)
        }.onTapGesture {
            vm.setPlanet(name)
            //order is important here for setting the field to highlighted
            isHiglighted = !isHiglighted
            vm.setColorForCell(isHiglighted)
        }
    }
}

struct PlanetCollectionViewCellUI_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCollectionViewCellUI()
    }
}
