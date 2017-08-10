//
//  ModelMapperTest.swift
//  JJLAccountTests
//
//  Created by Jose Jimeno Linares on 31/7/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import XCTest

class ModelMapperTest: XCTestCase {
    
    
    func testMapper()
    {
        let model: AccountsModel = AccountsModel(JSONString: provideModelTest())!
        XCTAssertNotNil(model)
        guard let account = model.accounts?.first else {
            XCTFail(_: "there is no account")
            return
        }
        XCTAssertEqual(985000, account.balanceInCents)
        XCTAssertEqual(AccountCurrency.EUR, account.currency)
        XCTAssertEqual(748757694, account.id)
        XCTAssertEqual("Hr P L G N StellingTD", account.name)
        XCTAssertEqual(748757694, account.number)
//        XCTAssertEqual(AccountType.PAYMENT, account.)
        XCTAssertEqual("", account.alias)
        XCTAssertTrue(account.visible!)
        XCTAssertEqual("NL23INGB0748757694", account.iban)
    }
    
    
    func provideModelTest() -> String
    {
        return "{ \"accounts\": [{" +
            "\"accountBalanceInCents\": 985000," +
            "\"accountCurrency\": \"EUR\"," +
            "\"accountId\": 748757694," +
            "\"accountName\": \"Hr P L G N StellingTD\"," +
            "\"accountNumber\": 748757694," +
            "\"accountType\": \"PAYMENT\"," +
            "\"alias\": \"\"," +
            "\"isVisible\": true," +
            "\"iban\": \"NL23INGB0748757694\"" +
            "}]}"
    }
    
}
