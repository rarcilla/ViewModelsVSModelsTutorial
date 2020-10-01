//
//  ContentView.swift
//  ViewModelsVsModelsTutorial
//
//  Created by Regina Arcilla on 2020-09-30.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var createBankAccountVM = CreateBankAccountViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter SSN", text: self.$createBankAccountVM.ssn)
                TextField("Enter Balance", text: self.$createBankAccountVM.balance)
                
                Picker(selection: self.$createBankAccountVM.accountType, label: Text("Account Type")) {
                    Text("Chequing").tag(BankAccountType.chequing)
                    Text("Saving").tag(BankAccountType.saving)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Button("Open") {
                    self.createBankAccountVM.openBankAccount()
                }

                Text(self.createBankAccountVM.message)
            }
            .padding()
            .navigationBarTitle("Open Account")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
