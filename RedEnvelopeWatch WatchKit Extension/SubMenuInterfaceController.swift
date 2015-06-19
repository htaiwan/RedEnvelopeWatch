//
//  SubMenuInterfaceController.swift
//  RedEnvelopeWatch
//
//  Created by htaiwan on 6/9/15.
//  Copyright (c) 2015 htaiwan. All rights reserved.
//

import WatchKit
import Foundation

enum Style : Int {
    case Friend
    case Hotel
}

protocol SubMenuInterfaceControllerDelegate {
    func didSeletStyle(style:Style, string:String, index:Int)
}

class SubMenuInterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    var style : Style!
    var data : [String]!
    var delegate : SubMenuInterfaceControllerDelegate?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        var c = context as! Context
        style = c.style
        delegate = c.delegate
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        getData(style)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let string = data[rowIndex]
        self.delegate?.didSeletStyle(style, string: string, index: rowIndex)
        popController()
    }
    
    private func getData(style: Style) {
        if style == .Friend {
            data = ["不熟鄰居，久未聯絡的朋友，點頭之交","普通親戚，常往來的朋友，客戶","世交，常往來的親戚，有私交的好友，重要客戶","兄弟姊妹，摯友，大客戶，恩人"]
        }
        if style == .Hotel {
            data = ["自宅，辦桌","一般餐廳","大型場地餐廳","四星級飯店","五星級飯店"]
        }
        
        table.setNumberOfRows(data.count, withRowType: "tableRow")
        reloadTable()
    }
    
    private func reloadTable() {
        for i in 0 ..< table.numberOfRows {
            let row = table.rowControllerAtIndex(i) as! tableRow
            row.label.setText(data[i])
        }
    }
    



}
