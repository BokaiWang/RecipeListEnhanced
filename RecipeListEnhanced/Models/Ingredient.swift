//
//  Ingredient.swift
//  RecipeListEnhanced
//
//  Created by 王柏凱 on 2021-11-29.
//

import Foundation

class Ingredient: Decodable, Identifiable {
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
