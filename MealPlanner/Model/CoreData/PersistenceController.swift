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
                print(error.localizedDescription)
            }
        }
    }
    
    static func clearDatabase(using context: NSManagedObjectContext) {
        let mealPlanFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MealPlan")
        let mealPlanStageFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MealPlanStage")
        let recipeFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        let recipeIngredientFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipeIngredient")
        let ingredientFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Ingredient")
        let instructionFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Instruction")
        
        let mealPlanDeleteRequest = NSBatchDeleteRequest(fetchRequest: mealPlanFetchRequest)
        let mealPlanStageDeleteRequest = NSBatchDeleteRequest(fetchRequest: mealPlanStageFetchRequest)
        let recipeDeleteRequest = NSBatchDeleteRequest(fetchRequest: recipeFetchRequest)
        let recipeIngredientDeleteRequest = NSBatchDeleteRequest(fetchRequest: recipeIngredientFetchRequest)
        let ingredientDeleteRequest = NSBatchDeleteRequest(fetchRequest: ingredientFetchRequest)
        let instructionDeleteRequest = NSBatchDeleteRequest(fetchRequest: instructionFetchRequest)
        
        do {
            try context.execute(mealPlanDeleteRequest)
        } catch {
            //handle errors here
        }
        
        do {
            try context.execute(mealPlanStageDeleteRequest)
        } catch {
            //handle errors here
        }
        
        do {
            try context.execute(recipeDeleteRequest)
        } catch {
            //handle errors here
        }
        
        do {
            try context.execute(recipeIngredientDeleteRequest)
        } catch {
            //handle errors here
        }
        
        do {
            try context.execute(ingredientDeleteRequest)
        } catch {
            //handle errors here
        }
        
        do {
            try context.execute(instructionDeleteRequest)
        } catch {
            //handle errors here
        }
    }
    
    static func prePopulate(using container: NSPersistentContainer) {
        
        let recipe1 = Recipe(context: container.viewContext)
        recipe1.name = "Breakfast Bars"
        recipe1.tag = "Breakfast"
        recipe1.preparationTime = 300.0
        recipe1.cookingTime = 2400.0
        recipe1.serves = 10
        
        let instruction1 = Instruction(context: container.viewContext)
        instruction1.stepNumber = 1
        instruction1.body = "Preheat your oven to 180C/160C fan. Oil and line a 20cm deep tin with baking parchment"
        
        let instruction2 = Instruction(context: container.viewContext)
        instruction2.stepNumber = 2
        instruction2.body = "Mash the bananas, then stir in the oil, egg, and sugar"
        
        let instruction3 = Instruction(context: container.viewContext)
        instruction3.stepNumber = 3
        instruction3.body = "Fold in the muesli, 80% of the fruit mix and add a pinch of salt"
        
        let instruction4 = Instruction(context: container.viewContext)
        instruction4.stepNumber = 4
        instruction4.body = "Bake for 40 minutes. Allow to cool, then turn out and cut into 10 bars"
        
        recipe1.addToInstructions(instruction1)
        recipe1.addToInstructions(instruction2)
        recipe1.addToInstructions(instruction3)
        recipe1.addToInstructions(instruction4)
        
        let vegetableOil = Ingredient(context: container.viewContext)
        vegetableOil.name = "Vegetable oil"
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
        
        let recipe2 = Recipe(context: container.viewContext)
        recipe2.name = "Shakshuka"
        recipe2.tag = "Breakfast"
        recipe2.preparationTime = 300.0
        recipe2.cookingTime = 1200.0
        recipe2.serves = 2
        
        let instruction5 = Instruction(context: container.viewContext)
        instruction5.stepNumber = 1
        instruction5.body = "Heat the oil in a frying pan, with the lid on"
        
        let instruction6 = Instruction(context: container.viewContext)
        instruction6.stepNumber = 2
        instruction6.body = "Soften the onions, chili, garlic and coriander for 5 minutes"
        
        let instruction7 = Instruction(context: container.viewContext)
        instruction7.stepNumber = 3
        instruction7.body = "Stir in the tomatoes and sugar, and simmer for 8-10 minutes"
        
        let instruction8 = Instruction(context: container.viewContext)
        instruction8.stepNumber = 4
        instruction8.body = "Using the back of a large spoon, make 4 wells in the sauce. Crack an egg into each one. Put the lid back on the pan and cook on a low heat for 6-8 minutes"
        
        recipe2.addToInstructions(instruction5)
        recipe2.addToInstructions(instruction6)
        recipe2.addToInstructions(instruction7)
        recipe2.addToInstructions(instruction8)
        
        let oliveOil = Ingredient(context: container.viewContext)
        oliveOil.name = "Olive oil"
        oliveOil.unit = "ml"
        oliveOil.quantity = 1
        oliveOil.calories = 7
        oliveOil.carbs = 0.0
        oliveOil.fat = 0.8
        oliveOil.fibre = 0.0
        oliveOil.protein = 0.0
        oliveOil.salt = 0.0
        oliveOil.saturates = 0.1
        oliveOil.sugars = 0.0
        
        let redOnion = Ingredient(context: container.viewContext)
        redOnion.name = "Red onion"
        redOnion.quantity = 1
        redOnion.calories = 41
        redOnion.carbs = 9.5
        redOnion.fat = 0.2
        redOnion.fibre = 1.3
        redOnion.protein = 1.3
        redOnion.salt = 0.0028
        redOnion.saturates = 0.0
        redOnion.sugars = 4.4
        
        let redChili = Ingredient(context: container.viewContext)
        redChili.name = "Red chili"
        redChili.quantity = 1
        redChili.calories = 18
        redChili.carbs = 4.0
        redChili.fat = 0.2
        redChili.fibre = 0.7
        redChili.protein = 0.8
        redChili.salt = 0.0041
        redChili.saturates = 0.0
        redChili.sugars = 2.4
        
        let garlicClove = Ingredient(context: container.viewContext)
        garlicClove.name = "Garlic clove"
        garlicClove.quantity = 1
        garlicClove.calories = 5
        garlicClove.carbs = 1.0
        garlicClove.fat = 0.0
        garlicClove.fibre = 0.1
        garlicClove.protein = 0.2
        garlicClove.salt = 0.0005
        garlicClove.saturates = 0.0
        garlicClove.sugars = 2.4
        
        let coriander = Ingredient(context: container.viewContext)
        coriander.name = "Coriander"
        coriander.unit = "g"
        coriander.quantity = 1
        coriander.calories = 1
        coriander.carbs = 0.0
        coriander.fat = 0.0
        coriander.fibre = 0.0
        coriander.protein = 0.0
        coriander.salt = 0.0005
        coriander.saturates = 0.0
        coriander.sugars = 0.0
        
        let cherryTomatoCan = Ingredient(context: container.viewContext)
        cherryTomatoCan.name = "Can of cherry tomatoes"
        cherryTomatoCan.unit = "g"
        cherryTomatoCan.quantity = 190
        cherryTomatoCan.calories = 30
        cherryTomatoCan.carbs = 6.6
        cherryTomatoCan.fat = 0.5
        cherryTomatoCan.fibre = 3.6
        cherryTomatoCan.protein = 1.5
        cherryTomatoCan.salt = 0.219
        cherryTomatoCan.saturates = 0.1
        cherryTomatoCan.sugars = 4.8
        
        let casterSugar = Ingredient(context: container.viewContext)
        casterSugar.name = "Caster sugar"
        casterSugar.unit = "g"
        casterSugar.quantity = 1
        casterSugar.calories = 4
        casterSugar.carbs = 1.0
        casterSugar.fat = 0.0
        casterSugar.fibre = 0.0
        casterSugar.protein = 0.0
        casterSugar.salt = 0.0
        casterSugar.saturates = 0.0
        casterSugar.sugars = 1.0
        
        let recipeIngredient7 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient8 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient9 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient10 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient11 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient12 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient13 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient14 = RecipeIngredient(context: container.viewContext)
        
        recipeIngredient7.ingredient = oliveOil
        recipeIngredient7.quantity = 18
        recipeIngredient8.ingredient = redOnion
        recipeIngredient8.quantity = 2
        recipeIngredient9.ingredient = redChili
        recipeIngredient9.quantity = 1
        recipeIngredient10.ingredient = garlicClove
        recipeIngredient10.quantity = 1
        recipeIngredient11.ingredient = coriander
        recipeIngredient11.quantity = 4
        recipeIngredient12.ingredient = cherryTomatoCan
        recipeIngredient12.quantity = 2
        recipeIngredient13.ingredient = casterSugar
        recipeIngredient13.quantity = 6
        recipeIngredient14.ingredient = largeEgg
        recipeIngredient14.quantity = 4
        
        recipe2.addToRecipeIngredients(recipeIngredient7)
        recipe2.addToRecipeIngredients(recipeIngredient8)
        recipe2.addToRecipeIngredients(recipeIngredient9)
        recipe2.addToRecipeIngredients(recipeIngredient10)
        recipe2.addToRecipeIngredients(recipeIngredient11)
        recipe2.addToRecipeIngredients(recipeIngredient12)
        recipe2.addToRecipeIngredients(recipeIngredient13)
        recipe2.addToRecipeIngredients(recipeIngredient14)
        
        let recipe3 = Recipe(context: container.viewContext)
        recipe3.name = "Breakfast Smoothie"
        recipe3.tag = "Breakfast"
        recipe3.preparationTime = 120.0
        recipe3.cookingTime = 0.0
        recipe3.serves = 2
        
        let instruction9 = Instruction(context: container.viewContext)
        instruction9.stepNumber = 1
        instruction9.body = "Put all ingredients into a blender and blend for 1 minute"
        
        let instruction10 = Instruction(context: container.viewContext)
        instruction10.stepNumber = 2
        instruction10.body = "Pour into two glasses and serve"
        
        recipe3.addToInstructions(instruction9)
        recipe3.addToInstructions(instruction10)
        
        let porridgeOats = Ingredient(context: container.viewContext)
        porridgeOats.name = "Porridge oats"
        porridgeOats.unit = "g"
        porridgeOats.quantity = 1
        porridgeOats.calories = 1
        porridgeOats.carbs = 0.1
        porridgeOats.fat = 0.0
        porridgeOats.fibre = 0.01
        porridgeOats.protein = 0.008
        porridgeOats.salt = 0.00046
        porridgeOats.saturates = 0.011
        porridgeOats.sugars = 0.001
        
        let softFruit = Ingredient(context: container.viewContext)
        softFruit.name = "Soft fruit"
        softFruit.unit = "g"
        softFruit.quantity = 1
        softFruit.calories = 1
        softFruit.carbs = 0.2
        softFruit.fat = 0.003
        softFruit.fibre = 0.02
        softFruit.protein = 0.008
        softFruit.salt = 0.00002
        softFruit.saturates = 0.0006
        softFruit.sugars = 0.1
        
        let milk = Ingredient(context: container.viewContext)
        milk.name = "Milk"
        milk.unit = "ml"
        milk.quantity = 1
        milk.calories = 1
        milk.carbs = 0.05
        milk.fat = 0.02
        milk.fibre = 0.0
        milk.protein = 0.03
        milk.salt = 0.0005
        milk.saturates = 0.01
        milk.sugars = 0.04
        
        let honey = Ingredient(context: container.viewContext)
        honey.name = "Honey"
        honey.unit = "ml"
        honey.quantity = 1
        honey.calories = 4
        honey.carbs = 0.95
        honey.fat = 0.0
        honey.fibre = 0.0
        honey.protein = 0.005
        honey.salt = 0.00004
        honey.saturates = 0.0
        honey.sugars = 0.95
        
        let vanillaExtract = Ingredient(context: container.viewContext)
        vanillaExtract.name = "Vanilla extract"
        vanillaExtract.unit = "ml"
        vanillaExtract.quantity = 1
        vanillaExtract.calories = 2
        vanillaExtract.carbs = 0.08
        vanillaExtract.fat = 0.0
        vanillaExtract.fibre = 0.0
        vanillaExtract.protein = 0.0
        vanillaExtract.salt = 0.00006
        vanillaExtract.saturates = 0.0
        vanillaExtract.sugars = 0.08
        
        let recipeIngredient15 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient16 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient17 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient18 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient19 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient20 = RecipeIngredient(context: container.viewContext)
        
        recipeIngredient15.ingredient = banana
        recipeIngredient15.quantity = 1
        recipeIngredient16.ingredient = porridgeOats
        recipeIngredient16.quantity = 18
        recipeIngredient17.ingredient = softFruit
        recipeIngredient17.quantity = 80
        recipeIngredient18.ingredient = milk
        recipeIngredient18.quantity = 150
        recipeIngredient19.ingredient = honey
        recipeIngredient19.quantity = 6
        recipeIngredient20.ingredient = vanillaExtract
        recipeIngredient20.quantity = 6
        
        recipe3.addToRecipeIngredients(recipeIngredient15)
        recipe3.addToRecipeIngredients(recipeIngredient16)
        recipe3.addToRecipeIngredients(recipeIngredient17)
        recipe3.addToRecipeIngredients(recipeIngredient18)
        recipe3.addToRecipeIngredients(recipeIngredient19)
        recipe3.addToRecipeIngredients(recipeIngredient20)
        
        /*let recipe4 = Recipe(context: container.viewContext)
        recipe4.name = "Pancakes"
        recipe4.preparationTime = 60.0
        recipe4.cookingTime = 120.0
        recipe4.serves = 2
        
        let recipe5 = Recipe(context: container.viewContext)
        recipe5.name = "Eggs Benedict"
        recipe5.preparationTime = 300.0
        recipe5.cookingTime = 900.0
        recipe5.serves = 2 */
        
        let recipe6 = Recipe(context: container.viewContext)
        recipe6.name = "Red Pepper and Tomato Soup"
        recipe6.tag = "Lunch"
        recipe6.preparationTime = 600.0
        recipe6.cookingTime = 1800.0
        recipe6.serves = 2
        
        let instruction11 = Instruction(context: container.viewContext)
        instruction11.stepNumber = 1
        instruction11.body = "Preheat your oven to 200C/180C fan/gas 6. Put the tomatoes, onion and peppers in a roasting tin, toss with the oil and season. Roast for 25-30 minutes."
        
        let instruction12 = Instruction(context: container.viewContext)
        instruction12.stepNumber = 2
        instruction12.body = "Add the garlic cloves to the tin. Mix the vinegar into the tin then blend everything with a stick blender, adding water to loosen to your preferred consistency (we used around 150ml)."
        
        let instruction13 = Instruction(context: container.viewContext)
        instruction13.stepNumber = 3
        instruction13.body = "Reheat the soup if necessary, then spoon into two bowls and top each with a drizzle of oil. Serve"
        
        recipe6.addToInstructions(instruction11)
        recipe6.addToInstructions(instruction12)
        recipe6.addToInstructions(instruction13)
        
        let tomato = Ingredient(context: container.viewContext)
        tomato.name = "Tomato"
        tomato.quantity = 1
        tomato.calories = 22
        tomato.carbs = 4.8
        tomato.fat = 0.3
        tomato.fibre = 1.5
        tomato.protein = 1.1
        tomato.salt = 0.0062
        tomato.saturates = 0.0
        tomato.sugars = 3.2
        
        let romanoPepper = Ingredient(context: container.viewContext)
        romanoPepper.name = "Romano pepper"
        romanoPepper.quantity = 1
        romanoPepper.calories = 32
        romanoPepper.carbs = 7.6
        romanoPepper.fat = 0.2
        romanoPepper.fibre = 1.4
        romanoPepper.protein = 1.0
        romanoPepper.salt = 0.0023
        romanoPepper.saturates = 0.0
        romanoPepper.sugars = 5.0
        
        let redWineVinegar = Ingredient(context: container.viewContext)
        redWineVinegar.name = "Red wine vinegar"
        redWineVinegar.unit = "ml"
        redWineVinegar.quantity = 1
        redWineVinegar.calories = 1
        redWineVinegar.carbs = 0.0
        redWineVinegar.fat = 0.0
        redWineVinegar.fibre = 0.0
        redWineVinegar.protein = 0.0
        redWineVinegar.salt = 0.0006
        redWineVinegar.saturates = 0.0
        redWineVinegar.sugars = 0.0
        
        let recipeIngredient21 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient22 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient23 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient24 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient25 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient26 = RecipeIngredient(context: container.viewContext)
        
        recipeIngredient21.ingredient = tomato
        recipeIngredient21.quantity = 4
        recipeIngredient22.ingredient = redOnion
        recipeIngredient22.quantity = 1
        recipeIngredient23.ingredient = romanoPepper
        recipeIngredient23.quantity = 2
        recipeIngredient24.ingredient = oliveOil
        recipeIngredient24.quantity = 36
        recipeIngredient25.ingredient = garlicClove
        recipeIngredient25.quantity = 2
        recipeIngredient26.ingredient = redWineVinegar
        recipeIngredient26.quantity = 18
        
        recipe6.addToRecipeIngredients(recipeIngredient21)
        recipe6.addToRecipeIngredients(recipeIngredient22)
        recipe6.addToRecipeIngredients(recipeIngredient23)
        recipe6.addToRecipeIngredients(recipeIngredient24)
        recipe6.addToRecipeIngredients(recipeIngredient25)
        recipe6.addToRecipeIngredients(recipeIngredient26)
        
        let recipe7 = Recipe(context: container.viewContext)
        recipe7.name = "Tuna Lettuce Wraps"
        recipe7.tag = "Lunch"
        recipe7.preparationTime = 900.0
        recipe7.cookingTime = 120.0
        recipe7.serves = 2
        
        let instruction14 = Instruction(context: container.viewContext)
        instruction14.stepNumber = 1
        instruction14.body = "Brush the tuna with a little oil. Heat a non-stick pan, add the tuna and cook for 1 min each side. Transfer to a plate to rest"
        
        let instruction15 = Instruction(context: container.viewContext)
        instruction15.stepNumber = 2
        instruction15.body = "Halve and stone the avocado and scoop the flesh into a small bowl. Mash well until smooth. Spoon into two small dishes and put on serving plates with the lettuce leaves, and tomatoes."
        
        let instruction16 = Instruction(context: container.viewContext)
        instruction16.stepNumber = 3
        instruction16.body = "Slice the tuna and arrange on the plates. Spoon some of the mixture on the lettuce leaves and top with tuna and cherry tomatoes. Roll up and serve"
        
        recipe7.addToInstructions(instruction14)
        recipe7.addToInstructions(instruction15)
        recipe7.addToInstructions(instruction16)
        
        let tunaFillet = Ingredient(context: container.viewContext)
        tunaFillet.name = "Tuna fillet"
        tunaFillet.unit = "g"
        tunaFillet.quantity = 159
        tunaFillet.calories = 173
        tunaFillet.carbs = 0.0
        tunaFillet.fat = 1.4
        tunaFillet.fibre = 0.0
        tunaFillet.protein = 38
        tunaFillet.salt = 0.18
        tunaFillet.saturates = 0.4
        tunaFillet.sugars = 0.0
        
        let avocado = Ingredient(context: container.viewContext)
        avocado.name = "Avocado"
        avocado.quantity = 1
        avocado.calories = 322
        avocado.carbs = 17.0
        avocado.fat = 29.0
        avocado.fibre = 13.0
        avocado.protein = 4.0
        avocado.salt = 0.014
        avocado.saturates = 4.3
        avocado.sugars = 1.3
        
        let romaineLettuce = Ingredient(context: container.viewContext)
        romaineLettuce.name = "Romaine lettuce"
        romaineLettuce.quantity = 1
        romaineLettuce.calories = 6
        romaineLettuce.carbs = 3.1
        romaineLettuce.fat = 0.3
        romaineLettuce.fibre = 2.0
        romaineLettuce.protein = 1.2
        romaineLettuce.salt = 0.0075
        romaineLettuce.saturates = 0.0
        romaineLettuce.sugars = 1.1
        
        let cherryTomato = Ingredient(context: container.viewContext)
        cherryTomato.name = "Cherry tomato"
        cherryTomato.quantity = 1
        cherryTomato.calories = 3
        cherryTomato.carbs = 0.7
        cherryTomato.fat = 0.0
        cherryTomato.fibre = 0.2
        cherryTomato.protein = 0.1
        cherryTomato.salt = 0.00008
        cherryTomato.saturates = 0.0
        cherryTomato.sugars = 0.5
        
        let recipeIngredient27 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient28 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient29 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient30 = RecipeIngredient(context: container.viewContext)
        
        recipeIngredient27.ingredient = tunaFillet
        recipeIngredient27.quantity = 2
        recipeIngredient28.ingredient = avocado
        recipeIngredient28.quantity = 1
        recipeIngredient29.ingredient = romaineLettuce
        recipeIngredient29.quantity = 1
        recipeIngredient30.ingredient = cherryTomato
        recipeIngredient30.quantity = 16
        
        recipe7.addToRecipeIngredients(recipeIngredient27)
        recipe7.addToRecipeIngredients(recipeIngredient28)
        recipe7.addToRecipeIngredients(recipeIngredient29)
        recipe7.addToRecipeIngredients(recipeIngredient30)
        
        /* let recipe8 = Recipe(context: container.viewContext)
        recipe8.name = "Chicken Salad"
        recipe8.preparationTime = 600.0
        recipe8.cookingTime = 600.0
        recipe8.serves = 2
        
        let recipe9 = Recipe(context: container.viewContext)
        recipe9.name = "Chicken Noodles"
        recipe9.preparationTime = 600.0
        recipe9.cookingTime = 0.0
        recipe9.serves = 2 */
        
        let recipe10 = Recipe(context: container.viewContext)
        recipe10.name = "Chicken with Butter Beans"
        recipe10.tag = "Lunch"
        recipe10.preparationTime = 300.0
        recipe10.cookingTime = 0.0
        recipe10.serves = 2
        
        let instruction17 = Instruction(context: container.viewContext)
        instruction17.stepNumber = 1
        instruction17.body = "Roast the garlic cloves"
        
        let instruction18 = Instruction(context: container.viewContext)
        instruction18.stepNumber = 2
        instruction18.body = "Squeeze the garlic out of the skins and whisk together with the oil and seasoning in a bowl. Add the butter beans, peppers, tomatoes and rocket, and mix"
        
        let instruction19 = Instruction(context: container.viewContext)
        instruction19.stepNumber = 3
        instruction19.body = "Divide between two bowls. Top with the chicken and crumble over the feta"
        
        recipe10.addToInstructions(instruction17)
        recipe10.addToInstructions(instruction18)
        recipe10.addToInstructions(instruction19)
        
        let butterBeansCan = Ingredient(context: container.viewContext)
        butterBeansCan.name = "Can of butter beans"
        butterBeansCan.unit = "g"
        butterBeansCan.quantity = 400
        butterBeansCan.calories = 270
        butterBeansCan.carbs = 45.0
        butterBeansCan.fat = 1.5
        butterBeansCan.fibre = 15.0
        butterBeansCan.protein = 18.0
        butterBeansCan.salt = 1.86
        butterBeansCan.saturates = 0.0
        butterBeansCan.sugars = 6.0
        
        let rocket = Ingredient(context: container.viewContext)
        rocket.name = "Rocket"
        rocket.unit = "g"
        rocket.quantity = 1
        rocket.calories = 1
        rocket.carbs = 0.04
        rocket.fat = 0.01
        rocket.fibre = 0.02
        rocket.protein = 0.03
        rocket.salt = 0.00027
        rocket.saturates = 0.0
        rocket.sugars = 0.02
        
        let cookedChicken = Ingredient(context: container.viewContext)
        cookedChicken.name = "Cooked chicken"
        cookedChicken.unit = "g"
        cookedChicken.quantity = 1
        cookedChicken.calories = 2
        cookedChicken.carbs = 0.001
        cookedChicken.fat = 0.13
        cookedChicken.fibre = 0.0
        cookedChicken.protein = 0.24
        cookedChicken.salt = 0.00071
        cookedChicken.saturates = 0.037
        cookedChicken.sugars = 0.0
        
        let fetaCheese = Ingredient(context: container.viewContext)
        fetaCheese.name = "Feta cheese"
        fetaCheese.unit = "g"
        fetaCheese.quantity = 1
        fetaCheese.calories = 3
        fetaCheese.carbs = 0.041
        fetaCheese.fat = 0.21
        fetaCheese.fibre = 0.0
        fetaCheese.protein = 0.14
        fetaCheese.salt = 0.00917
        fetaCheese.saturates = 0.15
        fetaCheese.sugars = 0.041
        
        let recipeIngredient31 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient32 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient33 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient34 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient35 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient36 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient37 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient38 = RecipeIngredient(context: container.viewContext)
        
        recipeIngredient31.ingredient = garlicClove
        recipeIngredient31.quantity = 2
        recipeIngredient32.ingredient = oliveOil
        recipeIngredient32.quantity = 26
        recipeIngredient33.ingredient = butterBeansCan
        recipeIngredient33.quantity = 1
        recipeIngredient34.ingredient = romanoPepper
        recipeIngredient34.quantity = 2
        recipeIngredient35.ingredient = cherryTomato
        recipeIngredient35.quantity = 9
        recipeIngredient36.ingredient = rocket
        recipeIngredient36.quantity = 100
        recipeIngredient37.ingredient = cookedChicken
        recipeIngredient37.quantity = 150
        recipeIngredient38.ingredient = fetaCheese
        recipeIngredient38.quantity = 25
        
        recipe10.addToRecipeIngredients(recipeIngredient31)
        recipe10.addToRecipeIngredients(recipeIngredient32)
        recipe10.addToRecipeIngredients(recipeIngredient33)
        recipe10.addToRecipeIngredients(recipeIngredient34)
        recipe10.addToRecipeIngredients(recipeIngredient35)
        recipe10.addToRecipeIngredients(recipeIngredient36)
        recipe10.addToRecipeIngredients(recipeIngredient37)
        recipe10.addToRecipeIngredients(recipeIngredient38)
        
        /* let recipe11 = Recipe(context: container.viewContext)
        recipe11.name = "Slow Cooker Chicken Casserole"
        recipe11.preparationTime = 600.0
        recipe11.cookingTime = 21600.0
        recipe11.serves = 4 */
        
        let recipe12 = Recipe(context: container.viewContext)
        recipe12.name = "Chicken and Bean Enchiladas"
        recipe12.tag = "Dinner"
        recipe12.preparationTime = 600.0
        recipe12.cookingTime = 1800.0
        recipe12.serves = 4
        
        let instruction20 = Instruction(context: container.viewContext)
        instruction20.stepNumber = 1
        instruction20.body = "Preheat oven to 180C/160C fan/gas 4. Heat the oil in a frying pan and cook the onion and garlic for 5 mins"
        
        let instruction21 = Instruction(context: container.viewContext)
        instruction21.stepNumber = 2
        instruction21.body = "Stir in the kidney beans, chicken, and sweetcorn"
        
        let instruction22 = Instruction(context: container.viewContext)
        instruction22.stepNumber = 3
        instruction22.body = "Divide the mixture between the tortillas, sprinkle over half the cheese, then roll up and place into a baking dish"
        
        let instruction23 = Instruction(context: container.viewContext)
        instruction23.stepNumber = 4
        instruction23.body = "Sprinkle over the remaining cheese, then bake for 20-25 mins"
        
        recipe12.addToInstructions(instruction20)
        recipe12.addToInstructions(instruction21)
        recipe12.addToInstructions(instruction22)
        recipe12.addToInstructions(instruction23)
        
        let kidneyBeansCan = Ingredient(context: container.viewContext)
        kidneyBeansCan.name = "Can of kidney beans"
        kidneyBeansCan.unit = "g"
        kidneyBeansCan.quantity = 395
        kidneyBeansCan.calories = 348
        kidneyBeansCan.carbs = 66.4
        kidneyBeansCan.fat = 0.0
        kidneyBeansCan.fibre = 15.8
        kidneyBeansCan.protein = 25.3
        kidneyBeansCan.salt = 1.0428
        kidneyBeansCan.saturates = 0.0
        kidneyBeansCan.sugars = 3.2
        
        let sweetcornCan = Ingredient(context: container.viewContext)
        sweetcornCan.name = "Can of sweetcorn"
        sweetcornCan.unit = "g"
        sweetcornCan.quantity = 195
        sweetcornCan.calories = 195
        sweetcornCan.carbs = 39.0
        sweetcornCan.fat = 1.2
        sweetcornCan.fibre = 2.3
        sweetcornCan.protein = 4.9
        sweetcornCan.salt = 0.585
        sweetcornCan.saturates = 0.0
        sweetcornCan.sugars = 11.9
        
        let flourTortillas = Ingredient(context: container.viewContext)
        flourTortillas.name = "Flour tortillas"
        flourTortillas.quantity = 1
        flourTortillas.calories = 159
        flourTortillas.carbs = 27.0
        flourTortillas.fat = 3.5
        flourTortillas.fibre = 1.6
        flourTortillas.protein = 4.3
        flourTortillas.salt = 0.234
        flourTortillas.saturates = 0.9
        flourTortillas.sugars = 0.0
        
        let hardCheese = Ingredient(context: container.viewContext)
        hardCheese.name = "Hard cheese"
        hardCheese.unit = "g"
        hardCheese.quantity = 1
        hardCheese.calories = 4
        hardCheese.carbs = 0.031
        hardCheese.fat = 0.33
        hardCheese.fibre = 0.0
        hardCheese.protein = 0.23
        hardCheese.salt = 0.00653
        hardCheese.saturates = 0.19
        hardCheese.sugars = 0.005
        
        let recipeIngredient39 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient40 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient41 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient42 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient43 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient44 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient45 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient46 = RecipeIngredient(context: container.viewContext)
        
        recipeIngredient39.ingredient = vegetableOil
        recipeIngredient39.quantity = 18
        recipeIngredient40.ingredient = redOnion
        recipeIngredient40.quantity = 1
        recipeIngredient41.ingredient = garlicClove
        recipeIngredient41.quantity = 1
        recipeIngredient42.ingredient = kidneyBeansCan
        recipeIngredient42.quantity = 2
        recipeIngredient43.ingredient = cookedChicken
        recipeIngredient43.quantity = 150
        recipeIngredient44.ingredient = sweetcornCan
        recipeIngredient44.quantity = 1
        recipeIngredient45.ingredient = flourTortillas
        recipeIngredient45.quantity = 8
        recipeIngredient46.ingredient = hardCheese
        recipeIngredient46.quantity = 140
        
        recipe12.addToRecipeIngredients(recipeIngredient39)
        recipe12.addToRecipeIngredients(recipeIngredient40)
        recipe12.addToRecipeIngredients(recipeIngredient41)
        recipe12.addToRecipeIngredients(recipeIngredient42)
        recipe12.addToRecipeIngredients(recipeIngredient43)
        recipe12.addToRecipeIngredients(recipeIngredient44)
        recipe12.addToRecipeIngredients(recipeIngredient45)
        recipe12.addToRecipeIngredients(recipeIngredient46)
        
        /* let recipe13 = Recipe(context: container.viewContext)
        recipe13.name = "Fish Pie"
        recipe13.preparationTime = 900.0
        recipe13.cookingTime = 2700.0
        recipe13.serves = 4 */
        
        let recipe14 = Recipe(context: container.viewContext)
        recipe14.name = "Lasagne"
        recipe14.tag = "Dinner"
        recipe14.preparationTime = 900.0
        recipe14.cookingTime = 3600.0
        recipe14.serves = 4
        
        let instruction24 = Instruction(context: container.viewContext)
        instruction24.stepNumber = 1
        instruction24.body = "Heat the oil in a large saucepan. Add the onion, and cook over a medium heat for 5 minutes until softened"
        
        let instruction25 = Instruction(context: container.viewContext)
        instruction25.stepNumber = 2
        instruction25.body = "Add the garlic and cook for 1 minute, then add the mince and cook for 6 mins until browned"
        
        let instruction26 = Instruction(context: container.viewContext)
        instruction26.stepNumber = 3
        instruction26.body = "Add the chopped tomatoes. Fill each can half full with water to rinse out any tomatoes left in the can, and add to the pan. Season to taste. Simmer for 20 mins"
        
        let instruction27 = Instruction(context: container.viewContext)
        instruction27.stepNumber = 4
        instruction27.body = "Preheat oven to 200C/180C fan. To assemble the lasagne, ladle a little of the sauce into the bottom of the roasting tin, spreading it. Place 2 sheets of lasagne on top of the sauce overlapping, then repeat with more sauce and another layer of pasta. Repeat with a further 2 layers of sauce and pasta, finishing with a layer of pasta"
        
        let instruction28 = Instruction(context: container.viewContext)
        instruction28.stepNumber = 5
        instruction28.body = "Top with the mozzarella. Bake for 25–30 minutes. Allow to cool and serve"
        
        recipe14.addToInstructions(instruction24)
        recipe14.addToInstructions(instruction25)
        recipe14.addToInstructions(instruction26)
        recipe14.addToInstructions(instruction27)
        recipe14.addToInstructions(instruction28)
        
        let minceBeef = Ingredient(context: container.viewContext)
        minceBeef.name = "Mince beef"
        minceBeef.unit = "g"
        minceBeef.quantity = 500
        minceBeef.calories = 1360
        minceBeef.carbs = 0.0
        minceBeef.fat = 85.0
        minceBeef.fibre = 0.0
        minceBeef.protein = 135.0
        minceBeef.salt = 0.455
        minceBeef.saturates = 32.5
        minceBeef.sugars = 0.0
        
        let choppedTomatoCan = Ingredient(context: container.viewContext)
        choppedTomatoCan.name = "Can of chopped tomatoes"
        choppedTomatoCan.unit = "g"
        choppedTomatoCan.quantity = 400
        choppedTomatoCan.calories = 104
        choppedTomatoCan.carbs = 18.8
        choppedTomatoCan.fat = 0.8
        choppedTomatoCan.fibre = 2.0
        choppedTomatoCan.protein = 4.0
        choppedTomatoCan.salt = 0.16
        choppedTomatoCan.saturates = 0.0
        choppedTomatoCan.sugars = 16.4
        
        let lasagneSheets = Ingredient(context: container.viewContext)
        lasagneSheets.name = "Pack of lasagne sheets"
        lasagneSheets.unit = "g"
        lasagneSheets.quantity = 500
        lasagneSheets.calories = 133
        lasagneSheets.carbs = 26.7
        lasagneSheets.fat = 0.0
        lasagneSheets.fibre = 13.3
        lasagneSheets.protein = 6.7
        lasagneSheets.salt = 0.4
        lasagneSheets.saturates = 0.0
        lasagneSheets.sugars = 0.0
        
        let mozzarellaBall = Ingredient(context: container.viewContext)
        mozzarellaBall.name = "Ball of mozzarella"
        mozzarellaBall.quantity = 1
        mozzarellaBall.calories = 391
        mozzarellaBall.carbs = 2.9
        mozzarellaBall.fat = 29.0
        mozzarellaBall.fibre = 0.0
        mozzarellaBall.protein = 29.0
        mozzarellaBall.salt = 0.8188
        mozzarellaBall.saturates = 17.0
        mozzarellaBall.sugars = 1.3
        
        let recipeIngredient47 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient48 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient49 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient50 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient51 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient52 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient53 = RecipeIngredient(context: container.viewContext)
        
        recipeIngredient47.ingredient = oliveOil
        recipeIngredient47.quantity = 18
        recipeIngredient48.ingredient = redOnion
        recipeIngredient48.quantity = 1
        recipeIngredient49.ingredient = garlicClove
        recipeIngredient49.quantity = 2
        recipeIngredient50.ingredient = minceBeef
        recipeIngredient50.quantity = 1
        recipeIngredient51.ingredient = choppedTomatoCan
        recipeIngredient51.quantity = 2
        recipeIngredient52.ingredient = lasagneSheets
        recipeIngredient52.quantity = 1
        recipeIngredient53.ingredient = mozzarellaBall
        recipeIngredient53.quantity = 1
        
        recipe14.addToRecipeIngredients(recipeIngredient47)
        recipe14.addToRecipeIngredients(recipeIngredient48)
        recipe14.addToRecipeIngredients(recipeIngredient49)
        recipe14.addToRecipeIngredients(recipeIngredient50)
        recipe14.addToRecipeIngredients(recipeIngredient51)
        recipe14.addToRecipeIngredients(recipeIngredient52)
        recipe14.addToRecipeIngredients(recipeIngredient53)
        
        let recipe15 = Recipe(context: container.viewContext)
        recipe15.name = "Chicken and Sweet Potato Curry"
        recipe15.tag = "Dinner"
        recipe15.preparationTime = 600.0
        recipe15.cookingTime = 2700.0
        recipe15.serves = 4
        
        let instruction29 = Instruction(context: container.viewContext)
        instruction29.stepNumber = 1
        instruction29.body = "Heat the oil in a pan, add the onion and cook over a low heat for about 5 minutes until softened. Increase the heat, add the chicken to heat through"
        
        let instruction30 = Instruction(context: container.viewContext)
        instruction30.stepNumber = 2
        instruction30.body = "Crush the garlic cloves. Stir in the curry paste and garlic, cooking for 2 minutes. Add 100ml water, the sweet potatoes and chopped tomatoes. Simmer for 20-30 mins until the chicken is cooked through and the sweet potato is tender"
        
        let instruction31 = Instruction(context: container.viewContext)
        instruction31.stepNumber = 3
        instruction31.body = "Season to taste, removing the pan from the heat and stirring. Serve with basmati rice"
        
        recipe15.addToInstructions(instruction29)
        recipe15.addToInstructions(instruction30)
        recipe15.addToInstructions(instruction31)
        
        let kormaPasteJar = Ingredient(context: container.viewContext)
        kormaPasteJar.name = "Jar of korma paste"
        kormaPasteJar.unit = "g"
        kormaPasteJar.quantity = 165
        kormaPasteJar.calories = 242
        kormaPasteJar.carbs = 25.2
        kormaPasteJar.fat = 19.8
        kormaPasteJar.fibre = 0.0
        kormaPasteJar.protein = 2.1
        kormaPasteJar.salt = 0.4752
        kormaPasteJar.saturates = 11.1
        kormaPasteJar.sugars = 11.2
        
        let sweetPotato = Ingredient(context: container.viewContext)
        sweetPotato.name = "Sweet potato"
        sweetPotato.unit = "g"
        sweetPotato.quantity = 1
        sweetPotato.calories = 1
        sweetPotato.carbs = 0.216
        sweetPotato.fat = 0.002
        sweetPotato.fibre = 0.034
        sweetPotato.protein = 0.021
        sweetPotato.salt = 0.000369
        sweetPotato.saturates = 0.001
        sweetPotato.sugars = 0.067
        
        let basmatiRice = Ingredient(context: container.viewContext)
        basmatiRice.name = "Basmati rice"
        basmatiRice.unit = "g"
        basmatiRice.quantity = 1
        basmatiRice.calories = 1
        basmatiRice.carbs = 0.28
        basmatiRice.fat = 0.003
        basmatiRice.fibre = 0.004
        basmatiRice.protein = 0.027
        basmatiRice.salt = 0.00001
        basmatiRice.saturates = 0.001
        basmatiRice.sugars = 0.001
        
        let recipeIngredient54 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient55 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient56 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient57 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient58 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient59 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient60 = RecipeIngredient(context: container.viewContext)
        let recipeIngredient61 = RecipeIngredient(context: container.viewContext)
        
        recipeIngredient54.ingredient = vegetableOil
        recipeIngredient54.quantity = 18
        recipeIngredient55.ingredient = redOnion
        recipeIngredient55.quantity = 1
        recipeIngredient56.ingredient = cookedChicken
        recipeIngredient56.quantity = 450
        recipeIngredient57.ingredient = kormaPasteJar
        recipeIngredient57.quantity = 1
        recipeIngredient58.ingredient = garlicClove
        recipeIngredient58.quantity = 2
        recipeIngredient59.ingredient = sweetPotato
        recipeIngredient59.quantity = 500
        recipeIngredient60.ingredient = choppedTomatoCan
        recipeIngredient60.quantity = 1
        recipeIngredient61.ingredient = basmatiRice
        recipeIngredient61.quantity = 300
        
        recipe15.addToRecipeIngredients(recipeIngredient54)
        recipe15.addToRecipeIngredients(recipeIngredient55)
        recipe15.addToRecipeIngredients(recipeIngredient56)
        recipe15.addToRecipeIngredients(recipeIngredient57)
        recipe15.addToRecipeIngredients(recipeIngredient58)
        recipe15.addToRecipeIngredients(recipeIngredient59)
        recipe15.addToRecipeIngredients(recipeIngredient60)
        recipe15.addToRecipeIngredients(recipeIngredient61)
        
        let ketchup = Ingredient(context: container.viewContext)
        ketchup.name = "Heinz Tomato Ketchup"
        ketchup.ean = "50457236"
        ketchup.unit = "ml"
        ketchup.quantity = 1
        ketchup.calories = 1
        ketchup.carbs = 0.3
        ketchup.fat = 0.0
        ketchup.fibre = 0.0
        ketchup.protein = 0.0
        ketchup.salt = 0.01
        ketchup.saturates = 0.0
        ketchup.sugars = 0.2
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
