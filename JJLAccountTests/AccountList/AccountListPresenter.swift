//
//  AccountListPresenter.swift
//  JJLAccountTests
//
//  Created by Jose Jimeno Linares on 31/7/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import Foundation

protocol AccountDataPresenter {
    
    func queryData()
}

class AccountDataPresenterBase:AccountDataPresenter
{
    let dataSource: AccountDataSource
    let view:AccountListView
    
    init(dataSource:AccountDataSource, view:AccountListView){
        self.dataSource = dataSource
        self.view = view;
    }
    
    func queryData()
    {
        
    }
    
}

class AccountDataPresenterFullList : AccountDataPresenterBase
{
    
    override func queryData()
    {
        dataSource.getFullListWithCompletion() {
            let viewModel = AccountViewModelMapper.mapAccountModelArrayToViewModelArray(modelArray: $0)
            self.view.drawAccounts(accounts: viewModel)
        }
    }
}

class AcountDataPresenterVisibleList:AccountDataPresenterBase
{
    override func queryData()
    {
        dataSource.getVisibleListWithCompletion(){
            let viewModel = AccountViewModelMapper.mapAccountModelArrayToViewModelArray(modelArray: $0)
            self.view.drawAccounts(accounts: viewModel)
        }
    }
}


