//
//  DataService.swift
//  RecipeList
//
//  Created by 王柏凱 on 2021-11-23.
//

import Foundation

class DataService {
    // Parse local json file
    static func getLocalData() -> [Recipe] {
        // Get a path
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Get a url
        guard path != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: path!)
        
        // Get a data object
        do {
            let data = try Data(contentsOf: url)
            
            do {
                let parsedJson = try JSONDecoder().decode([Recipe].self, from: data)
                
                // Add the unique Ids
                for r in parsedJson {
                    r.id = UUID()
                    
                    // Add unique Ids to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                // the right data
                return parsedJson
                
            } catch {
                // error with parsing Json
                print(error)
            }
            
        } catch {
            // error with getting data
            print(error)
        }
        
        return [Recipe]()
    
    }
    
    
}
