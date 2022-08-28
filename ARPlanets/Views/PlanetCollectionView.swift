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
//                LinearGradient(gradient: Gradient(colors: [.blue, .red , .white]), startPoint: .topLeading, endPoint: .trailing)
//                    .ignoresSafeArea()
                RadialGradient(gradient: Gradient(colors: [.white, .black]), center: .center, startRadius: 10, endRadius: 200)
                    .ignoresSafeArea()
             
            VStack{
                Text("Select a Planet").colorInvert()
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


