//
//  ContentView.swift
//  JPApexPredators
//
//  Created by chris on 2024/09/02.
//

import SwiftUI
import MapKit
struct ContentView: View {
    
    let predators = Predators()
    @State var searchText = ""
    @State var isAlphabetical = false
    @State var currentSelection = PredatorType.all
    
    var filteredDinos: [ApexPredatorModel] {
        
        predators.filterType(by: currentSelection)
        
        predators.sort(by: isAlphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        
        VStack {
            NavigationStack{
                
                List(filteredDinos)
                { predator in
                    
                    NavigationLink{
                        // link an view
                        PredatorDetail(predator: predator, position: .camera(MapCamera(centerCoordinate: predator.location, distance: 30000)))
                        
                    } label: {
                        HStack {
                            //image
                            Image(predator.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .shadow(color: .white, radius: 1)
                            
                            VStack(alignment: .leading){
                                //Name
                                Text(predator.name)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                
                                //Type
                                Text(predator.type.rawValue.capitalized)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 5)
                                    .background(predator.type.backgroud)
                                    .clipShape(.capsule)
                            }// end of VStack
                        } // end of HStack
                    } // end of Label
                } // end of list
                
                .navigationTitle("Apex Predators")
                .searchable(text: $searchText)
                .autocorrectionDisabled()
                .animation(.default, value: searchText)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button{
                            withAnimation{
                                isAlphabetical.toggle()
                            }
                        } label: {
//                            if alphabetical{
//                                Image(systemName: "film")
//                            } else {
//                                Image(systemName: "textformat")
//                            }
                            Image(systemName: isAlphabetical ? "film" : "textformat")
                                .symbolEffect(.bounce, value: isAlphabetical)
                        }
                    } // end of  toolbarItem
                    ToolbarItem(placement: .topBarTrailing){
                        Menu{
                            Picker("Filter", selection: $currentSelection.animation()){
                                ForEach(PredatorType.allCases){
                                    type in
                                    Label(type.rawValue.capitalized, systemImage: type.icon)
                                }
                            }
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                    } // end of toolbarItem
                } // end of toolbar
            } // end of NavigationStack
        } // end of VStack
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    } //end of some View
} //end of View

#Preview {
    ContentView()
}
