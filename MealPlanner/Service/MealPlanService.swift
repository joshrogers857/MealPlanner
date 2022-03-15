//
//  MealPlanService.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 15/03/2022.
//

import Foundation
import CoreData

struct MealPlanService {
    var moc: NSManagedObjectContext
    
    func fetchMealPlan(date selectedDate: Date) -> MealPlan? {
        let request = MealPlan.fetchRequest()
        
        // Start
        // Code from: https://stackoverflow.com/a/71482203/11821338
        
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: selectedDate)
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        let predicate = NSPredicate(format: "date >= %@ AND date < %@", argumentArray: [startDate, endDate])
        
        // End
        
        request.predicate = predicate
        
        var results: [MealPlan] = []
        
        moc.performAndWait {
            results = try! request.execute()
        }
        
        if(results.isEmpty) {
            return nil
        } else {
            return results[0]
        }
    }
    
    func createMealPlan(date selectedDate: Date) throws -> MealPlan {
        let mealPlan = MealPlan(context: moc)
        mealPlan.date = selectedDate
        
        let stage = MealPlanStage(context: moc)
        stage.name = "Stage1"
        stage.listPosition = 1
        
        mealPlan.addToStages(stage)
        
        do {
            try moc.save()
        } catch {
            throw error
        }
        
        return fetchMealPlan(date: selectedDate)!
    }
}
