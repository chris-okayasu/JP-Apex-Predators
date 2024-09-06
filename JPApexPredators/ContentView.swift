//
//  ContentView.swift
//  JPApexPredators
//
//  Created by chris on 2024/09/02.
//

import SwiftUI

struct ContentView: View {
    
    let predators = Predators()
    
    @State var searchText = ""
    
    var filteredDinos: [ApexPredatorModel] {
        if searchText.isEmpty {
            return predators.apexPredators
        } else {
            return predators.apexPredators.filter{
//                predator in
//                predator.name.localizedCaseInsensitiveContains(searchText)
                $0.name.localizedCaseInsensitiveContains(searchText)

            }
        }
    }
    
    var body: some View {
        
        VStack {
            NavigationStack{
                
                List(filteredDinos)
                { predator in
                    
                    NavigationLink{
                        // link an view
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
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
            } // end of NavigationStack
            
        } // end of VStack
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    } //end of some View
} //end of View

#Preview {
    ContentView()
}
