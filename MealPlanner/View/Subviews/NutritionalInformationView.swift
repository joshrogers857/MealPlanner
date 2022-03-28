//
//  NutritionalInformationView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 17/03/2022.
//

import SwiftUI

struct NutritionalInformationView: View {
    @Binding var refresh: Bool
    @FetchRequest private var mealPlans: FetchedResults<MealPlan>
    private var startDate: Date
    private var endDate: Date
    
    var body: some View {
        Group {
            Text("Calories: \(mealPlans.reduce(0) { $0 + $1.caloriesPerPerson})")
            NutritionListItem(primaryText: "Carbs: \(mealPlans.reduce(0) { $0 + $1.carbsPerPerson})g", recommended: "260g")
            NutritionListItem(primaryText: "Fat: \(mealPlans.reduce(0) { $0 + $1.fatPerPerson})g", recommended: "less than 70g")
            NutritionListItem(primaryText: "Fibre: \(mealPlans.reduce(0) { $0 + $1.fibrePerPerson})g", recommended: "30g")
            NutritionListItem(primaryText: "Protein: \(mealPlans.reduce(0) { $0 + $1.proteinPerPerson})g", recommended: "50g")
            NutritionListItem(primaryText: "Salt: \(mealPlans.reduce(0) { $0 + $1.saltPerPerson})g", recommended: "less than 6g")
            NutritionListItem(primaryText: "Saturates: \(mealPlans.reduce(0) { $0 + $1.saturatesPerPerson})g", recommended: "less than 20g")
            NutritionListItem(primaryText: "Sugars: \(mealPlans.reduce(0) { $0 + $1.sugarsPerPerson})g", recommended: "90g")
        }
        .onChange(of: refresh) {
            newValue in
            
            refresh = false
        }
    }
    
    init(startDate: Date, endDate: Date, refresh: Binding<Bool>) {
        _mealPlans = FetchRequest<MealPlan>(
            sortDescriptors: [],
            predicate: NSPredicate(
                format: "date >= %@ AND date < %@",
                argumentArray: [startDate, endDate]
            )
        )
        
        self.startDate = startDate
        self.endDate = endDate
        _refresh = refresh
    }
}

/*struct NutritionalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionalInformationView()
    }
}*/
