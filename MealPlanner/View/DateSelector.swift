//
//  DateSelector.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 15/03/2022.
//

import SwiftUI

struct DateSelector: View {
    @State var date: Date
    
    var body: some View {
        HStack {
            Button {
                date = date - 86400
            } label: {
                Image(systemName: "arrowtriangle.backward.fill")
            }
            
            Text(dateToString(date).0)
            
            Button {
                date = date + 86400
            } label: {
                Image(systemName: "arrowtriangle.forward.fill")
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

struct DateSelector_Previews: PreviewProvider {
    static var previews: some View {
        DateSelector(date: Date.now)
    }
}
