//
//  AccountDataSource.swift
//  JJLAccountTests
//
//  Created by Jose Jimeno Linares on 31/7/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import Foundation
import ObjectMapper

public protocol AccountDataSource {
    func getFullListWithCompletion(result:@escaping([AccountModel]?) -> Void)
    func getVisibleListWithCompletion(result:@escaping ([AccountModel]?) -> Void)
}

public class AccountDataSourceImp:AccountDataSource
{
    public func getFullListWithCompletion(result:@escaping([AccountModel]?) -> Void)
    {
        DispatchQueue.global(qos: .default).async {
            let data : [AccountModel]? = self.getDataArray()
            DispatchQueue.main.async {
                result(data)
            }
            
        }
    }
    public func getVisibleListWithCompletion(result:@escaping ([AccountModel]?) -> Void)
    {
        DispatchQueue.global(qos: .default).async {
            let data : [AccountModel]? = self.getDataArray()?.filter({ (it) -> Bool in
                return it.visible!
            })
            DispatchQueue.main.async {
                result(data)
            }
            
        }

    }
    
    func getDataArray() -> [AccountModel]?{
        return AccountsModel(JSONString: getResponse()!)?.accounts
    }

    func getResponse() -> String?
    {
        guard let filePath = Bundle.main.path(forResource:"response", ofType:"json")else { return nil}
        do{
            return try String(contentsOfFile: filePath)
        }catch{
            return nil
        }
    }
}
