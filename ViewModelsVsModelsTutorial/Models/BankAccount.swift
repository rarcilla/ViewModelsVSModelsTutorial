//
//  BankAccount.swift
//  ViewModelsVsModelsTutorial
//
//  Created by Regina Arcilla on 2020-09-30.
//

import Foundation

enum BankAccountError: Error {
    case minimumFundsRequirementError(_ minAmount: Double)
}

class BankAccount {
    var ssn: String
    var balance: Double
    var accountType: BankAccountType
    var accountNumber: String?
    
    init(ssn: String, balance: Double, accountType: BankAccountType = .chequing) {
        self.ssn = ssn
        self.balance = balance
        self.accountType = accountType
    }
    
    func open() throws -> String? {
        if accountType == .chequing {
            if balance < 100 {
                throw BankAccountError.minimumFundsRequirementError(100)
            }
        } else if accountType == .saving {
            if balance < 500 {
                throw BankAccountError.minimumFundsRequirementError(500)
            }
        }
        
        self.accountNumber = UUID().uuidString
        return self.accountNumber
    }
}
