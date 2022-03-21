//
//  MealPlanView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct MealPlanView: View {
    @EnvironmentObject private var selectedDate: SelectedDate
    
    var body: some View {
        NavigationView {
            VStack {
                DateSelectorView()
                
                Spacer()
                
                MealPlanList(selectedDate: selectedDate.date)
                
                Spacer()
            }
            .navigationTitle("MealPlanner")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func dateToString(_ date: Date) -> (String, String) {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/YYYY"
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        return (df.string(from: date), "\(hour):\(minute):\(second)")
    }
}

struct MealPlanView_Previews: PreviewProvider {
    static var previews: some View {
        MealPlanView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(SelectedDate())
    }
}
