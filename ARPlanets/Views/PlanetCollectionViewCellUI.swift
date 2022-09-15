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
    //@State var currentColor = Color.cyan
    private let width = (UIScreen.main.bounds.width/3)-20
    
    var body: some View {
        VStack{
            ZStack{
                Image("moon")
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.init(degrees: -2))
                    .background{
                        //should create a isHiglighted custom object that holds the planet name and bool for true or false to highlight the object
//
//                        RoundedRectangle(cornerRadius: 40)
//                            .frame(width: 200, height: 200).foregroundColor(vm.cellcolor ?? Color.white)
                    }
            }.onTapGesture {
                vm.setPlanet(name)
                //order is important here for setting the field to highlighted
//                vm.isHiglighted = !vm.isHiglighted
//                vm.setColorForCell(vm.isHiglighted)
            }
            Text("\(name)").font(.largeTitle).foregroundColor(Color.red)
        }
        
    }
}

struct PlanetCollectionViewCellUI_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCollectionViewCellUI()
    }
}
