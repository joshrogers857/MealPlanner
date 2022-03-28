//
//  Recipe+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 27/03/2022.
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
    @NSManaged public var instructions: NSSet?
    @NSManaged public var mealPlanStages: NSSet?
    @NSManaged public var recipeIngredients: NSSet?

    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedTag: String {
        tag ?? "Unknown tag"
    }
    
    public var recipeIngredientsArray: [RecipeIngredient] {
        let set = recipeIngredients as? Set<RecipeIngredient> ?? []
        
        return set.sorted {
            $0.ingredient?.wrappedName ?? "" < $1.ingredient?.wrappedName ?? ""
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
        
        recipeIngredientsArray.forEach {
            recipeIngredient in
            
            total += Int(recipeIngredient.calories)
        }
        
        return total
    }
    
    public var caloriesPerPerson: Double {
        Double(calories) / Double(serves)
    }
    
    public var carbs: Double {
        var total = 0.0
        
        recipeIngredientsArray.forEach {
            recipeIngredient in
            
            total += recipeIngredient.carbs
        }
        
        return total
    }
    
    public var carbsPerPerson: Double {
        Double(carbs) / Double(serves)
    }
    
    public var fat: Double {
        var total = 0.0
        
        recipeIngredientsArray.forEach {
            recipeIngredient in
            
            total += recipeIngredient.fat
        }
        
        return total
    }
    
    public var fatPerPerson: Double {
        Double(fat) / Double(serves)
    }
    
    public var fibre: Double {
        var total = 0.0
        
        recipeIngredientsArray.forEach {
            recipeIngredient in
            
            total += recipeIngredient.fibre
        }
        
        return total
    }
    
    public var fibrePerPerson: Double {
        Double(fibre) / Double(serves)
    }
    
    public var protein: Double {
        var total = 0.0
        
        recipeIngredientsArray.forEach {
            recipeIngredient in
            
            total += recipeIngredient.protein
        }
        
        return total
    }
    
    public var proteinPerPerson: Double {
        Double(protein) / Double(serves)
    }
    
    public var salt: Double {
        var total = 0.0
        
        recipeIngredientsArray.forEach {
            recipeIngredient in
            
            total += recipeIngredient.salt
        }
        
        return total
    }
    
    public var saltPerPerson: Double {
        Double(salt) / Double(serves)
    }
    
    public var saturates: Double {
        var total = 0.0
        
        recipeIngredientsArray.forEach {
            recipeIngredient in
            
            total += recipeIngredient.saturates
        }
        
        return total
    }
    
    public var saturatesPerPerson: Double {
        Double(saturates) / Double(serves)
    }
    
    public var sugars: Double {
        var total = 0.0
        
        recipeIngredientsArray.forEach {
            recipeIngredient in
            
            total += recipeIngredient.sugars
        }
        
        return total
    }
    
    public var sugarsPerPerson: Double {
        Double(sugars) / Double(serves)
    }
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

// MARK: Generated accessors for recipeIngredients
extension Recipe {

    @objc(addRecipeIngredientsObject:)
    @NSManaged public func addToRecipeIngredients(_ value: RecipeIngredient)

    @objc(removeRecipeIngredientsObject:)
    @NSManaged public func removeFromRecipeIngredients(_ value: RecipeIngredient)

    @objc(addRecipeIngredients:)
    @NSManaged public func addToRecipeIngredients(_ values: NSSet)

    @objc(removeRecipeIngredients:)
    @NSManaged public func removeFromRecipeIngredients(_ values: NSSet)

}

extension Recipe : Identifiable {

}
