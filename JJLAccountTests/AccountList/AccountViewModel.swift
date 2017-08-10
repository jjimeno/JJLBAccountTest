//
//  AccountViewModel.swift
//  JJLAccountTests
//
//  Created by Jose Jimeno Linares on 2/8/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import Foundation

class AccountViewModel
{
    var accountBalance: String
    var accountName: String
    var accountNumber: String
    var accountAlias: String
    var accountIban: String
    
    
    
    required init(accNumber:String, accIban:String, accAlias:String, accName: String, accBalance:String) {
        self.accountNumber = accNumber;
        self.accountIban = accIban;
        self.accountAlias = accAlias;
        self.accountName = accName;
        self.accountBalance = accBalance;
    }
}

public class AccountViewModelMapper
{
    static func mapAccountModelArrayToViewModelArray(modelArray:[AccountModel]?) -> [AccountViewModel]
    {
        var viewModelArray = [AccountViewModel]()
        for model in modelArray! {
            let accNumber = model.number ?? 0
            let accIban = model.iban ?? ""
            let accAlias = model.alias ?? ""
            let accName = model.name ?? ""
            let accBalance = model.balanceInCents ?? 0
            viewModelArray.append( AccountViewModel(accNumber: "\(accNumber)", accIban: accIban, accAlias: accAlias, accName: accName, accBalance: "\(accBalance)"))
        }
        return viewModelArray
    }
}
