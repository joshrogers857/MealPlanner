//
//  AddNewRecipeAddInstructionView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 29/03/2022.
//

import SwiftUI

struct AddNewRecipeAddInstructionView: View {
    @FocusState private var keyboardIsFocused: Bool
    
    @Binding var instructionBodies: [String]
    @Binding var isShowing: Bool
    
    @State private var instructionBody = ""
    
    var body: some View {
        VStack {
            Text("Add Instruction")
                .font(.largeTitle)
                .padding(.top, 8)
            
            Form {
                TextField("Instruction", text: $instructionBody)
                    .focused($keyboardIsFocused)
                
                Button {
                    instructionBodies.append(instructionBody)
                    
                    isShowing = false
                } label: {
                    Text("Add Instruction")
                }
                .disabled(instructionBody.isEmpty)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    keyboardIsFocused = false
                }
            }
        }
    }
}

/* struct AddNewRecipeAddInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipeAddInstructionView()
    }
} */
