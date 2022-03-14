//
//  MealPlanStage+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 14/03/2022.
//
//

import Foundation
import CoreData


extension MealPlanStage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealPlanStage> {
        return NSFetchRequest<MealPlanStage>(entityName: "MealPlanStage")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: MealPlan?
    @NSManaged public var recipes: NSSet?

    public var unwrappedName: String {
        name ?? "Unknown name"
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
