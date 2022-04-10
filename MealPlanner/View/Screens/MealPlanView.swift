//
//  MealPlanView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct MealPlanView: View {
    @EnvironmentObject private var selectedDate: SelectedDate
    @Binding var refresh: Bool
    
    @Environment(\.managedObjectContext) private var moc
    
    var body: some View {
        NavigationView {
            VStack {
                DateSelectorView()
                
                Spacer()
                
                MealPlanList(selectedDate: selectedDate.date)
                
                Spacer()
            }
            .navigationTitle("Meal Plan")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                }
            }
            /*.onAppear {
                PersistenceController.clearDatabase(using: moc)
            }*/
            .onDisappear {
                refresh = true
            }
        }
    }
}

/*struct MealPlanView_Previews: PreviewProvider {
    static var previews: some View {
        MealPlanView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(SelectedDate())
    }
}*/
