//
//  PlanetCollectionView.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-24.
//

import SwiftUI

struct PlanetCollectionView: View {

    @ObservedObject var vm = PlanetCollectionViewModel()

    var body: some View {
        ZStack{
            Text(vm.planet.currentPlanet)
            
        }.onAppear(perform: { vm.setPlanet()})
    }
}

struct PlanetCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCollectionView()
    }
}

func changePlanet() ->String{
    
    return "Sun"
    
}
