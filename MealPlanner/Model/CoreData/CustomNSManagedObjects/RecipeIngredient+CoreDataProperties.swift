//
//  RecipeIngredient+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
//
//

import Foundation
import CoreData


extension RecipeIngredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeIngredient> {
        return NSFetchRequest<RecipeIngredient>(entityName: "RecipeIngredient")
    }

    @NSManaged public var quantity: Int16
    @NSManaged public var ingredient: Ingredient?
    @NSManaged public var recipe: Recipe?

    public var calories: Int {
        return Int((ingredient?.calories ?? 0) * quantity)
    }
    
    public var carbs: Double {
        return (ingredient?.carbs ?? 0.0) * Double(quantity)
    }
    
    public var fat: Double {
        return (ingredient?.fat ?? 0.0) * Double(quantity)
    }
    
    public var fibre: Double {
        return (ingredient?.fibre ?? 0.0) * Double(quantity)
    }
    
    public var protein: Double {
        return (ingredient?.protein ?? 0.0) * Double(quantity)
    }
    
    public var salt: Double {
        return (ingredient?.salt ?? 0.0) * Double(quantity)
    }
    
    public var saturates: Double {
        return (ingredient?.saturates ?? 0.0) * Double(quantity)
    }
    
    public var sugars: Double {
        return (ingredient?.sugars ?? 0.0) * Double(quantity)
    }
}

extension RecipeIngredient : Identifiable {

}
