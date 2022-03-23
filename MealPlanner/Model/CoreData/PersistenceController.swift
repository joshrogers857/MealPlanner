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
        
        let recipe2 = Recipe(context: container.viewContext)
        recipe2.name = "Shakshuka"
        recipe2.preparationTime = 300.0
        recipe2.cookingTime = 1200.0
        recipe2.serves = 2
        
        let oliveOil = Ingredient(context: container.viewContext)
        oliveOil.name = "Olive oil"
        oliveOil.type = "raw"
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
        redOnion.type = "product"
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
        redChili.type = "product"
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
        garlicClove.type = "product"
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
        coriander.type = "raw"
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
        cherryTomatoCan.type = "product"
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
        casterSugar.type = "raw"
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
        recipe3.preparationTime = 120.0
        recipe3.cookingTime = 0.0
        recipe3.serves = 2
        
        let porridgeOats = Ingredient(context: container.viewContext)
        porridgeOats.name = "Porridge oats"
        porridgeOats.type = "raw"
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
        softFruit.type = "raw"
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
        milk.type = "raw"
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
        honey.type = "raw"
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
        vanillaExtract.type = "raw"
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
        recipe6.preparationTime = 600.0
        recipe6.cookingTime = 1800.0
        recipe6.serves = 2
        
        let tomato = Ingredient(context: container.viewContext)
        tomato.name = "Tomato"
        tomato.type = "product"
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
        romanoPepper.name = "romanoPepper"
        romanoPepper.type = "product"
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
        redWineVinegar.type = "raw"
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
        recipe7.preparationTime = 900.0
        recipe7.cookingTime = 120.0
        recipe7.serves = 2
        
        let tunaFillet = Ingredient(context: container.viewContext)
        tunaFillet.name = "Tuna fillet"
        tunaFillet.type = "product"
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
        avocado.type = "product"
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
        romaineLettuce.type = "product"
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
        cherryTomato.type = "product"
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
        recipe10.preparationTime = 300.0
        recipe10.cookingTime = 0.0
        recipe10.serves = 2
        
        let butterBeansCan = Ingredient(context: container.viewContext)
        butterBeansCan.name = "Can of butter beans"
        butterBeansCan.type = "product"
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
        rocket.type = "raw"
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
        cookedChicken.type = "raw"
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
        fetaCheese.type = "raw"
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
        recipe12.preparationTime = 600.0
        recipe12.cookingTime = 1800.0
        recipe12.serves = 4
        
        let kidneyBeansCan = Ingredient(context: container.viewContext)
        kidneyBeansCan.name = "Can of kidney beans"
        kidneyBeansCan.type = "product"
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
        sweetcornCan.type = "product"
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
        flourTortillas.type = "product"
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
        hardCheese.type = "raw"
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
        recipe14.preparationTime = 900.0
        recipe14.cookingTime = 3600.0
        recipe14.serves = 4
        
        let minceBeef = Ingredient(context: container.viewContext)
        minceBeef.name = "Mince beef"
        minceBeef.type = "product"
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
        choppedTomatoCan.type = "product"
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
        lasagneSheets.type = "product"
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
        mozzarellaBall.type = "product"
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
        recipe15.preparationTime = 600.0
        recipe15.cookingTime = 2700.0
        recipe15.serves = 4
        
        let kormaPasteJar = Ingredient(context: container.viewContext)
        kormaPasteJar.name = "Jar of korma paste"
        kormaPasteJar.type = "product"
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
        sweetPotato.type = "raw"
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
        basmatiRice.type = "raw"
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
