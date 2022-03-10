//
//  Recipe.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 08/03/2022.
//

import Foundation

struct Recipe: CustomStringConvertible {
    var name: String
    var preparationTime: TimeInterval
    var cookingTime: TimeInterval
    var serves: Int
    var ingredients: [String]
    var instructions: [String]
    
    var description: String {
        return """
        Recipe: \(name)
            Prep. time: \(preparationTime)
            Cooking time: \(cookingTime)
            Serves: \(serves) people
            Ingredients:
                \(ingredients)
            Instructions:
                \(instructions)
        """
    }
}
