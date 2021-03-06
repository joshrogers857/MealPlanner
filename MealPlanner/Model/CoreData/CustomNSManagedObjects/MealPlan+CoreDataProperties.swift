//
//  MealPlan+CoreDataProperties.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 30/03/2022.
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
    
    public var calories: Int {
        var total = 0
        
        stagesArray.forEach {
            stage in
            
            total += Int(stage.calories)
        }
        
        return total
    }
    
    public var caloriesPerPerson: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.caloriesPerPerson
        }
        
        return total
    }
    
    public var carbs: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.carbs
        }
        
        return total
    }
    
    public var carbsPerPerson: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.carbsPerPerson
        }
        
        return total
    }
    
    public var fat: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.fat
        }
        
        return total
    }
    
    public var fatPerPerson: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.fatPerPerson
        }
        
        return total
    }
    
    public var fibre: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.fibre
        }
        
        return total
    }
    
    public var fibrePerPerson: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.fibrePerPerson
        }
        
        return total
    }
    
    public var protein: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.protein
        }
        
        return total
    }
    
    public var proteinPerPerson: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.proteinPerPerson
        }
        
        return total
    }
    
    public var salt: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.salt
        }
        
        return total
    }
    
    public var saltPerPerson: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.saltPerPerson
        }
        
        return total
    }
    
    public var saturates: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.saturates
        }
        
        return total
    }
    
    public var saturatesPerPerson: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.saturatesPerPerson
        }
        
        return total
    }
    
    public var sugars: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.sugars
        }
        
        return total
    }
    
    public var sugarsPerPerson: Double {
        var total = 0.0
        
        stagesArray.forEach {
            stage in
            
            total += stage.sugarsPerPerson
        }
        
        return total
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
