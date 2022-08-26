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
        GeometryReader { gm in
            
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(vm.arrayOfPlanets, id: \.id){ planet in
                            ZStack{
                                PlanetCollectionViewCellUI(name: planet.name, row: vm.arrayOfPlanets.count)
                            }.onTapGesture {
                                vm.setPlanet(planet.name)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct PlanetCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCollectionView()
        
    }
}


