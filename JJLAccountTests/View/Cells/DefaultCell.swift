//
//  DefaultCell.swift
//  JJLAccountTests
//
//  Created by Jose Jimeno Linares on 31/7/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import UIKit

class DefaultCell : UITableViewCell
{
    
    @IBOutlet weak var lblAccountNumber: UILabel!
    @IBOutlet weak var lblIban: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    func drawAccount(accountInfo: AccountViewModel){
        self.lblAccountNumber.text = accountInfo.accountNumber
        self.lblName.text = accountInfo.accountName
        self.lblIban.text = accountInfo.accountIban
        self.lblBalance.text = accountInfo.accountBalance
    }
}
