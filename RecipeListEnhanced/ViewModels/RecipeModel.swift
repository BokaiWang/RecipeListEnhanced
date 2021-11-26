//
//  RecipeModel.swift
//  RecipeList
//
//  Created by 王柏凱 on 2021-11-23.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService.getLocalData()
    }
    
}
