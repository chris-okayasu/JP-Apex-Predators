//
//  PredatorMap.swift
//  JPApexPredators
//
//  Created by chris on 2024/09/14.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators()
    @State var position: MapCameraPosition
    @State var satellite: Bool = false
    var body: some View {
        Map(position: $position){
            ForEach(predators.apexPredators){predator in
                Annotation(predator.name, coordinate: predator.location){
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing){
            Button{
                satellite.toggle()
            }label: {
                Image(systemName: satellite ? "globe.asia.australia.fill" : "globe.asia.australia")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location, distance: 1000, heading: 250, pitch: 80))
    )
}
