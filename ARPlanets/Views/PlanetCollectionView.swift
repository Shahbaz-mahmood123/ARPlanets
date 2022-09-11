//
//  PlanetCollectionView.swift
//  ARDice
//
//  Created by Shahbaz Mahmmod on 2022-08-24.
//

import SwiftUI

struct PlanetCollectionView: View {
    
    @ObservedObject var vm = PlanetCollectionViewModel()
    @State var isHiglighted = false
    @State var currentPlanetText = ""
    
    var body: some View {
        NavigationView{
            
           
            ZStack{
//                Circle().fill(.white)
//                    .blur(radius: 100)
//                    .offset(x: 5, y: 20)
                VStack{
                    //currentPlanetText ?? "Choose a Planet" need to
                    // update text on planet selection
                    Text("Select a Planet")
                    ScrollView(.horizontal){
                        HStack(alignment: .top){    
                            ForEach(vm.arrayOfPlanets, id: \.id){ planet in
                                ZStack{
                                    PlanetCollectionViewCellUI(name: planet.name).padding(.horizontal, 10)
                                }
                            }
                        }
                    }
                    HStack{
                        Text("ThisAnother Section").colorInvert()
                    }.padding()
                    Spacer()
                }.background{
                    CustomArcShape().ignoresSafeArea()
                }
                
            }.frame( maxWidth: .infinity, maxHeight: .infinity).background(Color("BackgroundColor1"))
            

        }.navigationTitle("Selection Screen").font(.largeTitle)
            
    }
}

struct PlanetCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCollectionView()
    }
}


