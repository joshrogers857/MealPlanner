//
//  DateSelectorView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 15/03/2022.
//

import SwiftUI

struct DateSelectorView: View {
    @EnvironmentObject private var selectedDate: SelectedDate
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    let calendar = Calendar.current
                    selectedDate.date = calendar.date(byAdding: .day, value: -1, to: selectedDate.date)!
                } label: {
                    Image(systemName: "arrowtriangle.backward.fill")
                }
                
                Group {
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                DatePicker("Selected Date", selection: $selectedDate.date, displayedComponents: [.date])
                    .labelsHidden()
                
                Group {
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                Button {
                    let calendar = Calendar.current
                    selectedDate.date = calendar.date(byAdding: .day, value: 1, to: selectedDate.date)!
                } label: {
                    Image(systemName: "arrowtriangle.forward.fill")
                }
                
                Spacer()
            }
            .padding(.top, 6)
            .padding(.bottom, 2)
        }
    }
}

/*struct DateSelector_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectorView(date: Binding<Date>)
    }
}*/
