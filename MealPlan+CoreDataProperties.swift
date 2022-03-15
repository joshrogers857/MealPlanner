//
//  MealPlan+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 15/03/2022.
//
//

import Foundation
import CoreData


extension MealPlan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealPlan> {
        return NSFetchRequest<MealPlan>(entityName: "MealPlan")
    }

    @NSManaged public var date: Date?
    @NSManaged public var stages: NSSet?

    public var wrappedDate: Date {
        date ?? Date(timeIntervalSince1970: 0)
    }
    
    public var stagesArray: [MealPlanStage] {
        let set = stages as? Set<MealPlanStage> ?? []
        
        return set.sorted {
            $0.listPosition < $1.listPosition
        }
    }
}

// MARK: Generated accessors for stages
extension MealPlan {

    @objc(addStagesObject:)
    @NSManaged public func addToStages(_ value: MealPlanStage)

    @objc(removeStagesObject:)
    @NSManaged public func removeFromStages(_ value: MealPlanStage)

    @objc(addStages:)
    @NSManaged public func addToStages(_ values: NSSet)

    @objc(removeStages:)
    @NSManaged public func removeFromStages(_ values: NSSet)

}

extension MealPlan : Identifiable {

}
