//
//  NutritionServiceTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 21/03/2022.
//

import XCTest
@testable import MealPlanner

class NutritionServiceTests: XCTestCase {
    var nutritionService: NutritionService!
    
    func test_NutritionService_GettingStartAndEndDatesForToday_ShouldReturnCorrectDates() {
        let calendar = Calendar.current
        
        let startDate = calendar.startOfDay(for: Date.now)
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        let results = NutritionService.getStartAndEndDates(timePeriod: .today)
        
        XCTAssertEqual(startDate, results.0)
        XCTAssertEqual(endDate, results.1)
    }
    
    func test_NutritionService_GettingStartAndEndDatesForYesterday_ShouldReturnCorrectDates() {
        let calendar = Calendar.current
        
        let endDate = calendar.startOfDay(for: Date.now)
        let startDate = calendar.date(byAdding: .day, value: -1, to: endDate)!
        let results = NutritionService.getStartAndEndDates(timePeriod: .yesterday)
        
        XCTAssertEqual(startDate, results.0)
        XCTAssertEqual(endDate, results.1)
    }
    
    func test_NutritionService_GettingStartAndEndDatesForLastWeek_ShouldReturnCorrectDates() {
        let calendar = Calendar.current
        
        let endDate = calendar.startOfDay(for: Date.now + 86400)
        let startDate = calendar.date(byAdding: .day, value: -7, to: endDate)!
        let results = NutritionService.getStartAndEndDates(timePeriod: .lastWeek)
        
        XCTAssertEqual(startDate, results.0)
        XCTAssertEqual(endDate, results.1)
    }
    
    func test_NutritionService_GettingStartAndEndDatesForLastMonth_ShouldReturnCorrectDates() {
        let calendar = Calendar.current
        
        let endDate = calendar.startOfDay(for: Date.now + 86400)
        let startDate = calendar.date(byAdding: .day, value: -30, to: endDate)!
        let results = NutritionService.getStartAndEndDates(timePeriod: .lastMonth)
        
        XCTAssertEqual(startDate, results.0)
        XCTAssertEqual(endDate, results.1)
    }
    
    func test_NutritionService_GettingStartAndEndDatesForUpcomingWeek_ShouldReturnCorrectDates() {
        let calendar = Calendar.current
        
        let startDate = calendar.startOfDay(for: Date.now)
        let endDate = calendar.date(byAdding: .day, value: 7, to: startDate)!
        let results = NutritionService.getStartAndEndDates(timePeriod: .upcomingWeek)
        
        XCTAssertEqual(startDate, results.0)
        XCTAssertEqual(endDate, results.1)
    }
}
