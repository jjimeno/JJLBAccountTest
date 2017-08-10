//
//  InterfaceController.swift
//  watchApp Extension
//
//  Created by Jose Jimeno Linares on 1/8/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import WatchKit
import Foundation


class DefaultRowController : NSObject
{
    @IBOutlet weak var lbl : WKInterfaceLabel!
    
    func setText(text:String){
        lbl.setText(text)
    }
}

class MainPageInterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        table.setNumberOfRows(2, withRowType: "DefaultTableRowController")
        let texts = ["Full List", "Visible only"]
        for i in 0..<2{
            let rowController: DefaultRowController = table.rowController(at: i) as! DefaultRowController
            rowController.setText(text: texts[i])
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let vcName: String
        switch rowIndex {
        case 0:
            vcName = String(describing:AccountListInterfaceControllerFull.self)
        default:
            vcName = String(describing:AccountListInterfaceControllerVisibleOnly.self)
        }
        pushController(withName: vcName, context: nil)
    }

}
