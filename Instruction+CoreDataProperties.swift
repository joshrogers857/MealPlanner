//
//  Instruction+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 14/03/2022.
//
//

import Foundation
import CoreData


extension Instruction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Instruction> {
        return NSFetchRequest<Instruction>(entityName: "Instruction")
    }

    @NSManaged public var stepNumber: Int16
    @NSManaged public var body: String?
    @NSManaged public var origin: Recipe?

    public var unwrappedBody: String {
        body ?? "Unknown body"
    }
}

extension Instruction : Identifiable {

}
