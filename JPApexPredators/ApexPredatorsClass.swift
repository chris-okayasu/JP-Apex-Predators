//
//  ApexPredatorsClass.swift
//  JPApexPredators
//
//  Created by chris on 2024/09/05.
//

import Foundation

class Predators{
    
    var allApexPredators: [ApexPredatorModel] = [] // master list
    
    var apexPredators: [ApexPredatorModel] = [] // filter list
    //    @Published var searchTerm: String = ""
    
    init(){
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() { // get a file a decode
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredatorModel].self, from: data)
                apexPredators = allApexPredators
            } catch{
                print("Error deconding JSON data: \(error)")
            }
        }
    }
    
    // searcj a filter
    func search(for searchTerm: String) -> [ApexPredatorModel] {
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter{
                //                predator in
                //                predator.name.localizedCaseInsensitiveContains(searchTerm)
                $0.name.localizedCaseInsensitiveContains(searchTerm)
                
            }
        }
    }
    
    // sort needs 2 paramethers to compare each other in order to sort them
    func sort(by alphabetical: Bool){
        apexPredators.sort{ predator1, predator2 in
            if alphabetical{
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
    // filter needs to be reset since a 2nd filter will use the previous list even it was already use and filtered
    func filterType(by type: PredatorType) {
        if type != .all {
            apexPredators = allApexPredators.filter {
                $0.type == type
            }
        } else {
            apexPredators = allApexPredators
        }
    }
}
