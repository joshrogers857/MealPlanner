//
//  NutritionService.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 17/03/2022.
//

import Foundation

struct NutritionService {
    static func getStartAndEndDates(timePeriod: TimePeriod) -> (Date, Date) {
        
        let calendar = Calendar.current
        
        switch timePeriod {
            case .today:
                let startDate = calendar.startOfDay(for: Date.now)
                let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
            
                return (startDate, endDate)
            case .yesterday:
                let endDate = calendar.startOfDay(for: Date.now)
                let startDate = calendar.date(byAdding: .day, value: -1, to: endDate)!
        
                return (startDate, endDate)
            case .lastWeek:
                let endDate = calendar.startOfDay(for: Date.now + 86400)
                let startDate = calendar.date(byAdding: .day, value: -7, to: endDate)!
        
                return (startDate, endDate)
            case.lastMonth:
                let endDate = calendar.startOfDay(for: Date.now + 86400)
                let startDate = calendar.date(byAdding: .day, value: -30, to: endDate)!
        
                return (startDate, endDate)
            case .upcomingWeek:
                let startDate = calendar.startOfDay(for: Date.now)
                let endDate = calendar.date(byAdding: .day, value: 7, to: startDate)!
        
                return (startDate, endDate)
        }
    }
}
