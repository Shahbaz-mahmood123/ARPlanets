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
    @State var currentColor = Color.cyan
    private let width = (UIScreen.main.bounds.width/3)-20
    
    var body: some View {

        VStack{
            ZStack{
                if vm.isHiglighted.fieldName == name && vm.isHiglighted.isHighlighted == true{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 200, height: 200).foregroundColor(.white) .background{}
                } else {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 200, height: 200).foregroundColor(.clear) .background{}
                }

                Image(name)
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.init(degrees: -2))
                    .background{
                        //should create a isHiglighted custom object that holds the planet name and bool for true or false to highlight the object
                    }
            }.onTapGesture {
                vm.setPlanet(name)
                print(name)
                
                vm.setCellToHiglightedIfPlanetIsSelected(name: name)
                print(vm.isHiglighted)
                
            }
            Text("\(name)").font(.largeTitle).foregroundColor(Color.red)
        }

    }
}

struct PlanetCollectionViewCellUI_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCollectionViewCellUI(name: "Sun")
    }
}
