//
//  Ingredient+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 22/03/2022.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var calories: Int16
    @NSManaged public var carbs: Double
    @NSManaged public var fat: Double
    @NSManaged public var fibre: Double
    @NSManaged public var name: String?
    @NSManaged public var protein: Double
    @NSManaged public var quantity: Int16
    @NSManaged public var salt: Double
    @NSManaged public var saturates: Double
    @NSManaged public var sugars: Double
    @NSManaged public var unit: String?
    @NSManaged public var recipeIngredients: NSSet?

    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedUnit: String {
        unit ?? "Unknown unit"
    }
}

// MARK: Generated accessors for recipeIngredients
extension Ingredient {

    @objc(addRecipeIngredientsObject:)
    @NSManaged public func addToRecipeIngredients(_ value: RecipeIngredient)

    @objc(removeRecipeIngredientsObject:)
    @NSManaged public func removeFromRecipeIngredients(_ value: RecipeIngredient)

    @objc(addRecipeIngredients:)
    @NSManaged public func addToRecipeIngredients(_ values: NSSet)

    @objc(removeRecipeIngredients:)
    @NSManaged public func removeFromRecipeIngredients(_ values: NSSet)

}

extension Ingredient : Identifiable {

}
