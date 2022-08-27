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
        NavigationView{
            VStack{
                Text("Select Your Planet")
                ScrollView(.horizontal){
                    HStack(alignment: .top){
                        ForEach(vm.arrayOfPlanets, id: \.id){ planet in
                            ZStack{
                                PlanetCollectionViewCellUI(name: planet.name, row: vm.arrayOfPlanets.count)
                            }.onTapGesture {
                                vm.setPlanet(planet.name)
                            }
                        }
                    }
                }
                Spacer()
                HStack{
                    Text("test")
                }
            }
        }.navigationTitle("Selection Screen").font(.largeTitle)
    }
    
}

struct PlanetCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCollectionView()
        
    }
}


