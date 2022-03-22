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
        
        let recipe1 = Recipe(context: container.viewContext)
        recipe1.name = "Breakfast Bars"
        recipe1.preparationTime = 300.0
        recipe1.cookingTime = 2400.0
        recipe1.serves = 10
        
        let vegetableOil = Ingredient(context: container.viewContext)
        vegetableOil.name = "Vegetable oil"
        vegetableOil.type = "raw"
        vegetableOil.unit = "ml"
        vegetableOil.quantity = 1
        vegetableOil.calories = 7
        vegetableOil.carbs = 0.0
        vegetableOil.fat = 0.8
        vegetableOil.fibre = 0.0
        vegetableOil.protein = 0.0
        vegetableOil.salt = 0.0
        vegetableOil.saturates = 0.06
        vegetableOil.sugars = 0.0
        
        let banana = Ingredient(context: container.viewContext)
        banana.name = "Banana"
        banana.type = "product"
        banana.quantity = 1
        banana.calories = 105
        banana.carbs = 27.0
        banana.fat = 0.4
        banana.fibre = 3.1
        banana.protein = 1.3
        banana.salt = 0.0012
        banana.saturates = 0.1
        banana.sugars = 14

        let largeEgg = Ingredient(context: container.viewContext)
        largeEgg.name = "Large egg"
        largeEgg.type = "product"
        largeEgg.quantity = 1
        largeEgg.calories = 72
        largeEgg.carbs = 0.4
        largeEgg.fat = 4.8
        largeEgg.fibre = 0.0
        largeEgg.protein = 6.3
        largeEgg.salt = 0.071
        largeEgg.saturates = 1.6
        largeEgg.sugars = 0.2
        
        let brownSugar = Ingredient(context: container.viewContext)
        brownSugar.name = "Brown sugar"
        brownSugar.type = "raw"
        brownSugar.unit = "g"
        brownSugar.quantity = 1
        brownSugar.calories = 3
        brownSugar.carbs = 0.9
        brownSugar.fat = 0.0
        brownSugar.fibre = 0.0
        brownSugar.protein = 0.0
        brownSugar.salt = 0.0003
        brownSugar.saturates = 0.0
        brownSugar.sugars = 0.9

        let nutMuesli = Ingredient(context: container.viewContext)
        nutMuesli.name = "Nut muesli"
        nutMuesli.type = "raw"
        nutMuesli.unit = "g"
        nutMuesli.quantity = 1
        nutMuesli.calories = 4
        nutMuesli.carbs = 0.8
        nutMuesli.fat = 0.0
        nutMuesli.fibre = 0.1
        nutMuesli.protein = 0.1
        nutMuesli.salt = 0.0003
        nutMuesli.saturates = 0.0
        nutMuesli.sugars = 0.2

        let driedFruitMix = Ingredient(context: container.viewContext)
        driedFruitMix.name = "Dried fruit mix"
        driedFruitMix.type = "raw"
        driedFruitMix.unit = "g"
        driedFruitMix.quantity = 1
        driedFruitMix.calories = 3
        driedFruitMix.carbs = 0.7
        driedFruitMix.fat = 0.0
        driedFruitMix.fibre = 0.1
        driedFruitMix.protein = 0.0
        driedFruitMix.salt = 0.0002
        driedFruitMix.saturates = 0.0
        driedFruitMix.sugars = 0.6
        
        let recipeIngredient1 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient3 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient4 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient5 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient6 = RecipeIngredient(context: container.viewContext)
        
        recipeIngredient1.ingredient = vegetableOil
        recipeIngredient1.quantity = 53
        recipeIngredient2.ingredient = banana
        recipeIngredient2.quantity = 2
        recipeIngredient3.ingredient = largeEgg
        recipeIngredient3.quantity = 1
        recipeIngredient4.ingredient = brownSugar
        recipeIngredient4.quantity = 70
        recipeIngredient5.ingredient = nutMuesli
        recipeIngredient5.quantity = 250
        recipeIngredient6.ingredient = driedFruitMix
        recipeIngredient6.quantity = 100
        
        recipe1.addToRecipeIngredients(recipeIngredient1)
        recipe1.addToRecipeIngredients(recipeIngredient2)
        recipe1.addToRecipeIngredients(recipeIngredient3)
        recipe1.addToRecipeIngredients(recipeIngredient4)
        recipe1.addToRecipeIngredients(recipeIngredient5)
        recipe1.addToRecipeIngredients(recipeIngredient6)
        
        /*let recipe2 = Recipe(context: container.viewContext)
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
        recipe15.serves = 4 */
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
