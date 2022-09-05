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
            ZStack{
                VStack{
                    Text("Select a Planet").colorInvert()
                    ScrollView(.horizontal){
                        HStack(alignment: .top){
                            ForEach(vm.arrayOfPlanets, id: \.id){ planet in
                                ZStack{
                                    PlanetCollectionViewCellUI(name: planet.name)
                                }
                            }
                        }
                    }
                    Spacer()
                    HStack{
                        Text("test").colorInvert()
                    }
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


