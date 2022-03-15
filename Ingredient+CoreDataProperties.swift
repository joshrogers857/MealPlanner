//
//  Ingredient+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 15/03/2022.
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
    @NSManaged public var recipes: NSSet?

    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedUnit: String {
        unit ?? "Unknown unit"
    }
    
    public var recipesArray: [Recipe] {
        let set = recipes as? Set<Recipe> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for recipes
extension Ingredient {

    @objc(addRecipesObject:)
    @NSManaged public func addToRecipes(_ value: Recipe)

    @objc(removeRecipesObject:)
    @NSManaged public func removeFromRecipes(_ value: Recipe)

    @objc(addRecipes:)
    @NSManaged public func addToRecipes(_ values: NSSet)

    @objc(removeRecipes:)
    @NSManaged public func removeFromRecipes(_ values: NSSet)

}

extension Ingredient : Identifiable {

}
