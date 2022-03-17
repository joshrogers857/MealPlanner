//
//  TimePeriod.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 17/03/2022.
//

import Foundation
import SwiftUI

enum TimePeriod: String, Equatable, CaseIterable {
    case today = "Today"
    case yesterday = "Yesterday"
    case lastWeek = "Last Week"
    case lastMonth = "Last Month"
    case upcomingWeek = "Upcoming Week"
    
    var localizedName: LocalizedStringKey {
        LocalizedStringKey(rawValue)
    }
}
