//
//  CreateBankAccountVIewModel.swift
//  ViewModelsVsModelsTutorial
//
//  Created by Regina Arcilla on 2020-09-30.
//

import Foundation

enum BankAccountType {
    case chequing
    case saving
}

class CreateBankAccountViewModel: ObservableObject {
    var ssn: String = ""
    var balance: String = ""
    var accountType: BankAccountType = .chequing
    
    @Published var message: String = ""
    
    func openBankAccount() {
        if ssn.isEmpty || balance.isEmpty {
            self.message = "SSN and balance is required!"
            return
        }
        
        guard let balance = Double(self.balance), balance > 0 else {
            self.message = "Balance should be a number"
            return
        }
        
        let bankAccount = BankAccount(ssn: self.ssn, balance: balance, accountType: self.accountType)
        do {
            guard let accountNumber = try bankAccount.open() else {
                self.message = "Error creating account"
                return
            }
            self.message = "Bank Account \(accountNumber) has been created"
            
        } catch BankAccountError.minimumFundsRequirementError(let amount) {
            self.message = "The minimum amount is \(amount)"
        } catch {
            print(error)
        }
    }
}
