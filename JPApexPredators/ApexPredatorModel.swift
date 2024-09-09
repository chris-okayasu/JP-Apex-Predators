//
//  ApexPredatorModel.swift
//  JPApexPredators
//
//  Created by chris on 2024/09/02.
//

import Foundation
import SwiftUI

// match with JSON
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
    
    // computed property
    var image: String{
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
}

enum PredatorType: String, Decodable, CaseIterable, Identifiable {
    
    case all
    case land
    case air
    case sea
    
    var id: PredatorType{
        self
    }
    
    var backgroud: Color {
        switch self {
        case .land:
                .brown
        case .air:
                .teal
        case .sea:
                .blue
        case .all:
                .black
        }
    }
    
    var icon: String{
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        }
    }
}
