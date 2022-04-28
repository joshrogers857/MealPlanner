//
//  HealthStoreViewModel.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import Foundation
import HealthKit

class HealthStore: ObservableObject {
    
    //Singleton object to be used throughout the app
    static let shared = HealthStore()
    
    private(set) var store: HKHealthStore?
    @Published private(set) var activeCalories: Double = 0.0
    @Published private(set) var basalCalories: Double = 0.0
    var totalCalories: Double {
        activeCalories + basalCalories
    }
    
    private init() {
        //Check if healthkit is available on the device. If not, set store to nil
        if HKHealthStore.isHealthDataAvailable() {
            store = HKHealthStore()
            
            let allTypes = Set([
                HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                HKObjectType.quantityType(forIdentifier: .basalEnergyBurned)!
            ])

            //Assert non-nil as we have the isHealthDataAvailable check above
            store!.requestAuthorization(toShare: nil, read: allTypes) {
                (success, error) in
                    if !success {
                        //If permissions are not obtained, act as if the
                        //store does not exist
                        self.store = nil
                    }
            }
        } else {
            store = nil
        }
    }
    
    func activeCaloriesQuery(startDate: Date, endDate: Date) {
        
        //Create sample type
        guard let activeEnergyType = HKSampleType.quantityType(
            forIdentifier: .activeEnergyBurned
        ) else {
            // This should never fail when using a defined constant.
            fatalError("*** Unable to get the active energy type ***")
        }

        //Create predicate
        let today = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        
        //Query using sample type and predicate
        let query = HKStatisticsQuery(
            quantityType: activeEnergyType,
            quantitySamplePredicate: today,
            options: .cumulativeSum
        ) { (query, statisticsOrNil, errorOrNil) in
            
            let sum = statisticsOrNil?.sumQuantity()
            let totalActiveCalories = sum?.doubleValue(for: HKUnit.largeCalorie()) //Specify unit to use
            
            DispatchQueue.main.async {
                self.activeCalories = totalActiveCalories ?? 0.0
            }
        }
        
        store?.execute(query)
    }
    
    func basalCaloriesQuery(startDate: Date, endDate: Date) {
        
        //Create sample type
        guard let basalEnergyType = HKSampleType.quantityType(
            forIdentifier: .basalEnergyBurned
        ) else {
            // This should never fail when using a defined constant.
            fatalError("*** Unable to get the basal energy type ***")
        }

        //Create predicate
        let today = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        
        //Query using sample type and predicate
        let query = HKStatisticsQuery(
            quantityType: basalEnergyType,
            quantitySamplePredicate: today,
            options: .cumulativeSum
        ) { (query, statisticsOrNil, errorOrNil) in
            
            let sum = statisticsOrNil?.sumQuantity()
            let totalBasalCalories = sum?.doubleValue(for: HKUnit.largeCalorie()) //Specify unit to use
            
            DispatchQueue.main.async {
                self.basalCalories = totalBasalCalories ?? 0.0
            }
        }
        
        store?.execute(query)
    }
}
