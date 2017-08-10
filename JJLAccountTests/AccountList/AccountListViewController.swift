//
//  AccountListViewController.swift
//  JJLAccountTests
//
//  Created by Jose Jimeno Linares on 31/7/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import Foundation

class AccountListViewControllerFull : AccountListBaseDataViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSource: AccountDataSource = AccountDataSourceImp()
        self.presenter = AccountDataPresenterFullList(dataSource:dataSource, view: self)
    }
}

class AccountListViewControllerVisibleOnly : AccountListBaseDataViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSource: AccountDataSource = AccountDataSourceImp()
        self.presenter = AcountDataPresenterVisibleList(dataSource:dataSource, view: self)
    }
}
