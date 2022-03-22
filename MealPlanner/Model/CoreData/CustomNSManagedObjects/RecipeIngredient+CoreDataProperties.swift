//
//  RecipeIngredient+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 22/03/2022.
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

}

extension RecipeIngredient : Identifiable {

}
