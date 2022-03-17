//
//  PersistenceController.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 14/03/2022.
//

import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        prePopulatePreview(using: controller.container)

        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        
        container = NSPersistentContainer(name: "Main")
        //container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        //PersistenceController.prePopulate(using: container)

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError()
            }
        }
    }
    
    static func prePopulate(using container: NSPersistentContainer) {
        
        let ingredient = Ingredient(context: container.viewContext)
        ingredient.calories = 10
        ingredient.carbs = 10
        ingredient.fat = 10
        ingredient.fibre = 10
        ingredient.protein = 10
        ingredient.saturates = 10
        ingredient.sugars = 10
        ingredient.salt = 10
        
        let recipe1 = Recipe(context: container.viewContext)
        recipe1.name = "Breakfast Bars"
        recipe1.preparationTime = 300.0
        recipe1.cookingTime = 2400.0
        recipe1.serves = 10
        recipe1.addToIngredients(ingredient)
        
        let recipe2 = Recipe(context: container.viewContext)
        recipe2.name = "Shakshuka"
        recipe2.preparationTime = 300.0
        recipe2.cookingTime = 1200.0
        recipe2.serves = 2
        recipe2.addToIngredients(ingredient)
        
        let recipe3 = Recipe(context: container.viewContext)
        recipe3.name = "Breakfast Smoothie"
        recipe3.preparationTime = 120.0
        recipe3.cookingTime = 0.0
        recipe3.serves = 2
        recipe3.addToIngredients(ingredient)
        
        let recipe4 = Recipe(context: container.viewContext)
        recipe4.name = "Pancakes"
        recipe4.preparationTime = 60.0
        recipe4.cookingTime = 120.0
        recipe4.serves = 2
        recipe4.addToIngredients(ingredient)
        
        let recipe5 = Recipe(context: container.viewContext)
        recipe5.name = "Eggs Benedict"
        recipe5.preparationTime = 300.0
        recipe5.cookingTime = 900.0
        recipe5.serves = 2
        recipe5.addToIngredients(ingredient)
        
        let recipe6 = Recipe(context: container.viewContext)
        recipe6.name = "Red Pepper and Tomato Soup"
        recipe6.preparationTime = 600.0
        recipe6.cookingTime = 1800.0
        recipe6.serves = 2
        recipe6.addToIngredients(ingredient)
        
        let recipe7 = Recipe(context: container.viewContext)
        recipe7.name = "Tuna Lettuce Wraps"
        recipe7.preparationTime = 900.0
        recipe7.cookingTime = 120.0
        recipe7.serves = 2
        recipe7.addToIngredients(ingredient)
        
        let recipe8 = Recipe(context: container.viewContext)
        recipe8.name = "Chicken Salad"
        recipe8.preparationTime = 600.0
        recipe8.cookingTime = 600.0
        recipe8.serves = 2
        recipe8.addToIngredients(ingredient)
        
        let recipe9 = Recipe(context: container.viewContext)
        recipe9.name = "Chicken Noodles"
        recipe9.preparationTime = 600.0
        recipe9.cookingTime = 0.0
        recipe9.serves = 2
        recipe9.addToIngredients(ingredient)
        
        let recipe10 = Recipe(context: container.viewContext)
        recipe10.name = "Chicken with Butter Beans"
        recipe10.preparationTime = 300.0
        recipe10.cookingTime = 0.0
        recipe10.serves = 2
        recipe10.addToIngredients(ingredient)
        
        let recipe11 = Recipe(context: container.viewContext)
        recipe11.name = "Slow Cooker Chicken Casserole"
        recipe11.preparationTime = 600.0
        recipe11.cookingTime = 21600.0
        recipe11.serves = 4
        recipe11.addToIngredients(ingredient)
        
        let recipe12 = Recipe(context: container.viewContext)
        recipe12.name = "Chicken and Bean Enchiladas"
        recipe12.preparationTime = 600.0
        recipe12.cookingTime = 1800.0
        recipe12.serves = 4
        recipe12.addToIngredients(ingredient)
        
        let recipe13 = Recipe(context: container.viewContext)
        recipe13.name = "Fish Pie"
        recipe13.preparationTime = 900.0
        recipe13.cookingTime = 2700.0
        recipe13.serves = 4
        recipe13.addToIngredients(ingredient)
        
        let recipe14 = Recipe(context: container.viewContext)
        recipe14.name = "Lasagne"
        recipe14.preparationTime = 900.0
        recipe14.cookingTime = 3600.0
        recipe14.serves = 4
        recipe14.addToIngredients(ingredient)
        
        let recipe15 = Recipe(context: container.viewContext)
        recipe15.name = "Chicken and Sweet Potato Curry"
        recipe15.preparationTime = 600.0
        recipe15.cookingTime = 2700.0
        recipe15.serves = 4
        recipe15.addToIngredients(ingredient)
    }
    
    static func prePopulatePreview(using container: NSPersistentContainer) {
        
        let mealPlan = MealPlan(context: container.viewContext)
        mealPlan.date = Date.now
        
        let recipe1 = Recipe(context: container.viewContext)
        recipe1.name = "Breakfast Bars"
        recipe1.preparationTime = 300.0
        recipe1.cookingTime = 2400.0
        recipe1.serves = 10
        
        let recipe2 = Recipe(context: container.viewContext)
        recipe2.name = "Shakshuka"
        recipe2.preparationTime = 300.0
        recipe2.cookingTime = 1200.0
        recipe2.serves = 2
        
        let recipe3 = Recipe(context: container.viewContext)
        recipe3.name = "Breakfast Smoothie"
        recipe3.preparationTime = 120.0
        recipe3.cookingTime = 0.0
        recipe3.serves = 2
        
        let recipe4 = Recipe(context: container.viewContext)
        recipe4.name = "Pancakes"
        recipe4.preparationTime = 60.0
        recipe4.cookingTime = 120.0
        recipe4.serves = 2
        
        let recipe5 = Recipe(context: container.viewContext)
        recipe5.name = "Eggs Benedict"
        recipe5.preparationTime = 300.0
        recipe5.cookingTime = 900.0
        recipe5.serves = 2
        
        let recipe6 = Recipe(context: container.viewContext)
        recipe6.name = "Red Pepper and Tomato Soup"
        recipe6.preparationTime = 600.0
        recipe6.cookingTime = 1800.0
        recipe6.serves = 2
        
        let recipe7 = Recipe(context: container.viewContext)
        recipe7.name = "Tuna Lettuce Wraps"
        recipe7.preparationTime = 900.0
        recipe7.cookingTime = 120.0
        recipe7.serves = 2
        
        let recipe8 = Recipe(context: container.viewContext)
        recipe8.name = "Chicken Salad"
        recipe8.preparationTime = 600.0
        recipe8.cookingTime = 600.0
        recipe8.serves = 2
        
        let recipe9 = Recipe(context: container.viewContext)
        recipe9.name = "Chicken Noodles"
        recipe9.preparationTime = 600.0
        recipe9.cookingTime = 0.0
        recipe9.serves = 2
        
        let recipe10 = Recipe(context: container.viewContext)
        recipe10.name = "Chicken with Butter Beans"
        recipe10.preparationTime = 300.0
        recipe10.cookingTime = 0.0
        recipe10.serves = 2
        
        let recipe11 = Recipe(context: container.viewContext)
        recipe11.name = "Slow Cooker Chicken Casserole"
        recipe11.preparationTime = 600.0
        recipe11.cookingTime = 21600.0
        recipe11.serves = 4
        
        let recipe12 = Recipe(context: container.viewContext)
        recipe12.name = "Chicken and Bean Enchiladas"
        recipe12.preparationTime = 600.0
        recipe12.cookingTime = 1800.0
        recipe12.serves = 4
        
        let recipe13 = Recipe(context: container.viewContext)
        recipe13.name = "Fish Pie"
        recipe13.preparationTime = 900.0
        recipe13.cookingTime = 2700.0
        recipe13.serves = 4
        
        let recipe14 = Recipe(context: container.viewContext)
        recipe14.name = "Lasagne"
        recipe14.preparationTime = 900.0
        recipe14.cookingTime = 3600.0
        recipe14.serves = 4
        
        let recipe15 = Recipe(context: container.viewContext)
        recipe15.name = "Chicken and Sweet Potato Curry"
        recipe15.preparationTime = 600.0
        recipe15.cookingTime = 2700.0
        recipe15.serves = 4
        
        let breakfast = MealPlanStage(context: container.viewContext)
        breakfast.name = "Breakfast"
        breakfast.listPosition = 1
        breakfast.addToRecipes([
            recipe1,
            recipe2
        ])
        
        mealPlan.addToStages(breakfast)
    }
}
