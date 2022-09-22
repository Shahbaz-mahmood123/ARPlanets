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
                VStack{
                    //currentPlanetText ?? "Choose a Planet" need to
                    // update text on planet selection

                    Text("Select a Planet").foregroundColor(Color.white)
                    ScrollView(.horizontal){
                        HStack(alignment: .top){    
                            ForEach(vm.arrayOfPlanets, id: \.id){ planet in
                                ZStack{
                                    PlanetCollectionViewCellUI(name: planet.name).padding(.horizontal, 20)
                                }
                            }
                        }
                    }.background{
                        RoundedRectangle(cornerRadius: 10).foregroundColor(Color.black)
                    }
                    HStack{

               Text("This is Another Section").foregroundColor(Color.white)
                    }.padding()
                    Spacer()
                }.background{
                    Image("Background")
                 }
            }.frame( maxWidth: .infinity, maxHeight: .infinity).background(Color.gray)

        }.navigationTitle("Selection Screen").font(.largeTitle)
            
    }
}

struct PlanetCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCollectionView()
    }
}
