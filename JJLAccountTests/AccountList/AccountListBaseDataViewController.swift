//
//  BaseDataViewController.swift
//  JJLAccountTests
//
//  Created by Jose Jimeno Linares on 31/7/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import UIKit


class AccountListBaseDataViewController : UIViewController
{
    var presenter : AccountDataPresenterBase?
    var modelData : [AccountViewModel]?
    @IBOutlet var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView(tableView: tableView!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.queryData()
    }
}

extension AccountListBaseDataViewController : AccountListView
{
    func drawAccounts(accounts: [AccountViewModel]) {
        modelData = accounts
        self.tableView?.reloadData()
    }
}


extension AccountListBaseDataViewController : UITableViewDataSource
{
    func configureTableView(tableView: UITableView){
        tableView.register(UINib.init(nibName: "DefaultCell", bundle: nil), forCellReuseIdentifier: String(describing: DefaultCell.self))
        tableView.dataSource = self.provideDataSource()
        tableView.rowHeight = 160
    }
    
    func modelAtIndex(index:Int)-> AccountViewModel?
    {
        return modelData?[index]
    }
    
    func provideDataSource() -> UITableViewDataSource
    {
        return self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = modelData?.count else{ return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: DefaultCell.self)
        
        let cell: DefaultCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! DefaultCell
        
        if let cellModel = self.modelAtIndex(index: indexPath.row){
            cell.drawAccount(accountInfo: cellModel)
        }
        return cell
    }
    
    
}
