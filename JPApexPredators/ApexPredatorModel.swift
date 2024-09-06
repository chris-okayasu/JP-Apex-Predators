//
//  ApexPredatorModel.swift
//  JPApexPredators
//
//  Created by chris on 2024/09/02.
//

import Foundation
import SwiftUI

struct ApexPredatorModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: PredatorType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    enum PredatorType: String, Decodable {
        case land
        case air
        case sea
        
        var backgroud: Color {
            switch self {
            case .land:
                    .brown
            case .air:
                    .teal
            case .sea:
                    .blue
            }
        }
    }
    
    // computed property
    var image: String{
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    
}
