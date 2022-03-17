//
//  MealPlanStage+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 15/03/2022.
//
//

import Foundation
import CoreData


extension MealPlanStage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealPlanStage> {
        return NSFetchRequest<MealPlanStage>(entityName: "MealPlanStage")
    }

    @NSManaged public var listPosition: Int16
    @NSManaged public var name: String?
    @NSManaged public var origin: MealPlan?
    @NSManaged public var recipes: NSSet?

    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var recipesArray: [Recipe] {
        let set = recipes as? Set<Recipe> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
    public var calories: Int {
        var total = 0
        
        recipesArray.forEach {
            recipe in
            
            total += Int(recipe.calories)
        }
        
        return total
    }
    
    public var carbs: Double {
        var total = 0.0
        
        recipesArray.forEach {
            recipe in
            
            total += recipe.carbs
        }
        
        return total
    }
    
    public var fat: Double {
        var total = 0.0
        
        recipesArray.forEach {
            recipe in
            
            total += recipe.fat
        }
        
        return total
    }
    
    public var fibre: Double {
        var total = 0.0
        
        recipesArray.forEach {
            recipe in
            
            total += recipe.fibre
        }
        
        return total
    }
    
    public var protein: Double {
        var total = 0.0
        
        recipesArray.forEach {
            recipe in
            
            total += recipe.protein
        }
        
        return total
    }
    
    public var salt: Double {
        var total = 0.0
        
        recipesArray.forEach {
            recipe in
            
            total += recipe.salt
        }
        
        return total
    }
    
    public var saturates: Double {
        var total = 0.0
        
        recipesArray.forEach {
            recipe in
            
            total += recipe.saturates
        }
        
        return total
    }
    
    public var sugars: Double {
        var total = 0.0
        
        recipesArray.forEach {
            recipe in
            
            total += recipe.sugars
        }
        
        return total
    }
}

// MARK: Generated accessors for recipes
extension MealPlanStage {

    @objc(addRecipesObject:)
    @NSManaged public func addToRecipes(_ value: Recipe)

    @objc(removeRecipesObject:)
    @NSManaged public func removeFromRecipes(_ value: Recipe)

    @objc(addRecipes:)
    @NSManaged public func addToRecipes(_ values: NSSet)

    @objc(removeRecipes:)
    @NSManaged public func removeFromRecipes(_ values: NSSet)

}

extension MealPlanStage : Identifiable {

}
