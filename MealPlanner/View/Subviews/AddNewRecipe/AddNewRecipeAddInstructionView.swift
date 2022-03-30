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
                    /*let instruction = Instruction(context: moc)
                    instruction.body = instructionBody
                    
                    if(instructions.isEmpty) {
                        instruction.stepNumber = 1
                    } else {
                        instruction.stepNumber = (instructions.sorted(by: { $0.stepNumber > $1.stepNumber })[0].stepNumber + 1)
                    }*/
                    
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
