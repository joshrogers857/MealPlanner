//
//  AddNewRecipeAddIngredientView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 29/03/2022.
//

import SwiftUI

import CodeScanner

struct AddNewRecipeAddIngredientView: View {
    @Environment(\.managedObjectContext) private var moc
    @FocusState private var keyboardIsFocused: Bool
    
    @Binding var quantities: [Int16]
    @Binding var ingredients: [Ingredient]
    @Binding var isShowing: Bool
    @State private var isShowingScanner = false
    
    @State private var quantity: Int16? = nil
    @State private var ingredient: Ingredient? = nil
    
    @FetchRequest(
        entity: Ingredient.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Ingredient.name, ascending: true)
        ]
    ) var ingredientList: FetchedResults<Ingredient>
    
    var body: some View {
        VStack {
            Text("Add Ingredient")
                .font(.largeTitle)
                .padding(.top, 8)
                .padding(.bottom, 4)
            
            Button {
                isShowingScanner = true
            } label: {
                Label("Scan barcode", systemImage: "camera")
            }
            
            Form {
                Section {
                    TextField("Quantity",
                              value: $quantity,
                              format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsFocused)
                }
                
                Section("Ingredients") {
                    List {
                        ForEach(ingredientList) {
                            ingredient in
                            
                            HStack {
                                if(ingredient.quantity > 1) {
                                    Text("\(ingredient.quantity)\(ingredient.wrappedUnit) \(ingredient.wrappedName)")
                                } else {
                                    Text(ingredient.wrappedName)
                                }
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .background(self.ingredient?.wrappedName == ingredient.wrappedName ? Color.gray : Color.white)
                            .onTapGesture {
                                if(self.ingredient?.wrappedName == ingredient.wrappedName) {
                                    self.ingredient = nil
                                } else {
                                    self.ingredient = ingredient
                                }
                            }
                        }
                    }
                }
                
                Section {
                    Button {
                        quantities.append(quantity!)
                        ingredients.append(ingredient!)
                        
                        isShowing = false
                    } label: {
                        Text("Add Ingredient")
                    }
                    .disabled(quantity == nil || quantity == 0 || ingredient == nil)
                }
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
        .sheet(isPresented: $isShowingScanner) {
            CodeScannerView(
                codeTypes: [.ean8, .ean13],
                showViewfinder: true
            ) {
                response in
                
                if case let .success(result) = response {
                    for ingredient in ingredientList {
                        if(ingredient.ean == result.string) {
                            self.ingredient = ingredient
                        }
                    }
                    
                    isShowingScanner = false
                }
            }
        }
    }
}

/* struct AddNewRecipeAddIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipeAddIngredientView()
    }
} */
