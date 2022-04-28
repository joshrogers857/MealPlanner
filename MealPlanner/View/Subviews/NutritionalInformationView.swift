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
            Text("Calories: \(round(mealPlans.reduce(0) { $0 + $1.caloriesPerPerson} * 100) / 100)")
            NutritionListItemView(primaryText: "Carbs: \(round(mealPlans.reduce(0) { $0 + $1.carbsPerPerson} * 100) / 100)g", recommended: "260g")
            NutritionListItemView(primaryText: "Fat: \(round(mealPlans.reduce(0) { $0 + $1.fatPerPerson} * 100) / 100)g", recommended: "less than 70g")
            NutritionListItemView(primaryText: "Fibre: \(round(mealPlans.reduce(0) { $0 + $1.fibrePerPerson} * 100) / 100)g", recommended: "30g")
            NutritionListItemView(primaryText: "Protein: \(round(mealPlans.reduce(0) { $0 + $1.proteinPerPerson} * 100) / 100)g", recommended: "50g")
            NutritionListItemView(primaryText: "Salt: \(round(mealPlans.reduce(0) { $0 + $1.saltPerPerson} * 100) / 100)g", recommended: "less than 6g")
            NutritionListItemView(primaryText: "Saturates: \(round(mealPlans.reduce(0) { $0 + $1.saturatesPerPerson} * 100) / 100)g", recommended: "less than 20g")
            NutritionListItemView(primaryText: "Sugars: \(round(mealPlans.reduce(0) { $0 + $1.sugarsPerPerson} * 100) / 100)g", recommended: "90g")
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
