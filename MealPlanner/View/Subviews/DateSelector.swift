//
//  DateSelector.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 15/03/2022.
//

import SwiftUI

struct DateSelector: View {
    @Binding var date: Date
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    let calendar = Calendar.current
                    date = calendar.date(byAdding: .day, value: -1, to: date)!
                } label: {
                    Image(systemName: "arrowtriangle.backward.fill")
                }
                
                Group {
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                DatePicker("Selected Date", selection: $date, displayedComponents: [.date])
                    .labelsHidden()
                
                Group {
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                Button {
                    let calendar = Calendar.current
                    date = calendar.date(byAdding: .day, value: 1, to: date)!
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
        DateSelector(date: Binding<Date>)
    }
}*/
