//
//  AccountModel.swift
//  JJLAccountTests
//
//  Created by Jose Jimeno Linares on 31/7/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import UIKit
import ObjectMapper

public enum AccountCurrency: String
{
    case EUR = "EUR"
}

public enum AccountType: String
{
    case PAYMENT = "PAYMENT"
    case SAVING = "SAVING"
    case CREDITCARDS = "CREDIRCARDS"
}

public class AccountModel : Mappable {
    
    var balanceInCents: Int64?
    var currency: AccountCurrency?
    var id:Int64?
    var name: String?
    var number:Int64?
    var alias:String?
    var visible:Bool?
    var iban: String?
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        balanceInCents <- map["accountBalanceInCents"]
        currency <- (map["accountCurrency"],EnumTransform<AccountCurrency>())
        id <- map["accountId"]
        name <- map["accountName"]
        number <- map["accountNumber"]
        alias <- map["alias"]
        visible <- map["isVisible"]
        iban <- map["iban"]
    }
}

public class AccountSavingModel : AccountModel
{
    var linkedId: Int64?
    var productName: String?
//    var productType: Int64
//    var savingsTargetReached: Int64
//    var targetAmountInCents: Int64
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        linkedId <- map["linkedAccountId"]
        productName <- map["productName"]
    }
}

public class AccountsModel : Mappable
{
    var accounts: [AccountModel]?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        accounts <- map["accounts"]
    }
}
