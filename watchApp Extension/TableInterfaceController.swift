//
//  TableInterfaceController.swift
//  JJLAccountTests
//
//  Created by Jose Jimeno Linares on 1/8/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import Foundation
import WatchKit

class AccountDefaultListRowController: NSObject
{
    @IBOutlet var lblAccountNumber: WKInterfaceLabel!
    @IBOutlet var lblIBan: WKInterfaceLabel!
    @IBOutlet var lblBalance: WKInterfaceLabel!
    
    func drawModel(model:AccountViewModel){
        lblAccountNumber.setText(model.accountNumber)
        lblIBan.setText(model.accountIban)
        lblBalance.setText(model.accountBalance)
    }
}

class AccountListBaseDataInterfaceController : WKInterfaceController
{
    
    var presenter : AccountDataPresenterBase?
    @IBOutlet var table: WKInterfaceTable!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        presenter?.queryData()
    }
}

extension AccountListBaseDataInterfaceController : AccountListView
{
    func drawAccounts(accounts: [AccountViewModel]) {
        let numRows = accounts.count
        table.setNumberOfRows(numRows, withRowType: String(describing:AccountDefaultListRowController.self))
        for i in 0..<numRows{
            let rowController: AccountDefaultListRowController = table.rowController(at: i) as! AccountDefaultListRowController
            rowController.drawModel(model: accounts[i])
        }
    }
}

class AccountListInterfaceControllerFull : AccountListBaseDataInterfaceController
{
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let dataSource: AccountDataSource = AccountDataSourceImp()
        self.presenter = AccountDataPresenterFullList(dataSource: dataSource, view: self)
    }
}

class AccountListInterfaceControllerVisibleOnly : AccountListBaseDataInterfaceController
{
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let dataSource: AccountDataSource = AccountDataSourceImp()
        self.presenter = AcountDataPresenterVisibleList(dataSource:dataSource, view: self)
    }
}
