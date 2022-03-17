//
//  Recipe+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 15/03/2022.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var cookingTime: Double
    @NSManaged public var name: String?
    @NSManaged public var preparationTime: Double
    @NSManaged public var serves: Int16
    @NSManaged public var tag: String?
    @NSManaged public var ingredients: NSSet?
    @NSManaged public var instructions: NSSet?
    @NSManaged public var mealPlanStages: NSSet?

    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedTag: String {
        tag ?? "Unknown tag"
    }
    
    public var ingredientsArray: [Ingredient] {
        let set = ingredients as? Set<Ingredient> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
    public var instructionsArray: [Instruction] {
        let set = instructions as? Set<Instruction> ?? []
        
        return set.sorted {
            $0.stepNumber < $1.stepNumber
        }
    }
    
    public var mealPlanStagesArray: [MealPlanStage] {
        let set = mealPlanStages as? Set<MealPlanStage> ?? []
        
        return set.sorted {
            $0.listPosition < $1.listPosition
        }
    }
    
    public var calories: Int {
        var total = 0
        
        ingredientsArray.forEach {
            ingredient in
            
            total += Int(ingredient.calories)
        }
        
        return total
    }
    
    public var carbs: Double {
        var total = 0.0
        
        ingredientsArray.forEach {
            ingredient in
            
            total += ingredient.carbs
        }
        
        return total
    }
    
    public var fat: Double {
        var total = 0.0
        
        ingredientsArray.forEach {
            ingredient in
            
            total += ingredient.fat
        }
        
        return total
    }
    
    public var fibre: Double {
        var total = 0.0
        
        ingredientsArray.forEach {
            ingredient in
            
            total += ingredient.fibre
        }
        
        return total
    }
    
    public var protein: Double {
        var total = 0.0
        
        ingredientsArray.forEach {
            ingredient in
            
            total += ingredient.protein
        }
        
        return total
    }
    
    public var salt: Double {
        var total = 0.0
        
        ingredientsArray.forEach {
            ingredient in
            
            total += ingredient.salt
        }
        
        return total
    }
    
    public var saturates: Double {
        var total = 0.0
        
        ingredientsArray.forEach {
            ingredient in
            
            total += ingredient.saturates
        }
        
        return total
    }
    
    public var sugars: Double {
        var total = 0.0
        
        ingredientsArray.forEach {
            ingredient in
            
            total += ingredient.sugars
        }
        
        return total
    }
}

// MARK: Generated accessors for ingredients
extension Recipe {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: Ingredient)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: Ingredient)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}

// MARK: Generated accessors for instructions
extension Recipe {

    @objc(addInstructionsObject:)
    @NSManaged public func addToInstructions(_ value: Instruction)

    @objc(removeInstructionsObject:)
    @NSManaged public func removeFromInstructions(_ value: Instruction)

    @objc(addInstructions:)
    @NSManaged public func addToInstructions(_ values: NSSet)

    @objc(removeInstructions:)
    @NSManaged public func removeFromInstructions(_ values: NSSet)

}

// MARK: Generated accessors for mealPlanStages
extension Recipe {

    @objc(addMealPlanStagesObject:)
    @NSManaged public func addToMealPlanStages(_ value: MealPlanStage)

    @objc(removeMealPlanStagesObject:)
    @NSManaged public func removeFromMealPlanStages(_ value: MealPlanStage)

    @objc(addMealPlanStages:)
    @NSManaged public func addToMealPlanStages(_ values: NSSet)

    @objc(removeMealPlanStages:)
    @NSManaged public func removeFromMealPlanStages(_ values: NSSet)

}

extension Recipe : Identifiable {

}
