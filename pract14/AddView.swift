//
//  AddView.swift
//  pract14
//
//  Created by Юрий  Лизунов on 02/12/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    
    static let types = ["Business", "Personal"]
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Price", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add")
            .navigationBarItems(trailing: Button("Save"){
                if let actualAmount = Int(self.amount){
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
            
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
