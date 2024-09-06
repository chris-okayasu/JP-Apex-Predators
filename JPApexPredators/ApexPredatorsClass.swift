//
//  ApexPredatorsClass.swift
//  JPApexPredators
//
//  Created by chris on 2024/09/05.
//

import Foundation

class Predators{
    
    var apexPredators: [ApexPredatorModel] = []
    
    init(){
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() { // get a file a decode
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredatorModel].self, from: data)
            } catch{
                print("Error deconding JSON data: \(error)")
            }
        }
    }
}
