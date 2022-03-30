//
//  Instruction+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 30/03/2022.
//
//

import Foundation
import CoreData


extension Instruction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Instruction> {
        return NSFetchRequest<Instruction>(entityName: "Instruction")
    }

    @NSManaged public var body: String?
    @NSManaged public var stepNumber: Int16
    @NSManaged public var origin: Recipe?

    public var wrappedBody: String {
        body ?? "Unknown body"
    }
}

extension Instruction : Identifiable {

}
