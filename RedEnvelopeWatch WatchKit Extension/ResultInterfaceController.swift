//
//  ResultInterfaceController.swift
//  RedEnvelopeWatch
//
//  Created by htaiwan on 6/9/15.
//  Copyright (c) 2015 htaiwan. All rights reserved.
//

import WatchKit
import Foundation


class ResultInterfaceController: WKInterfaceController {

    @IBOutlet weak var priceLabel: WKInterfaceLabel!
    @IBOutlet weak var mindLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        var c = context as! Context
        priceLabel.setText("\(c.money!) 元")
        setMindLabel(c.money!)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    private func setMindLabel(money: Int) {
        if money >= 3500 {
            mindLabel.setText("幹...這個月要喝西北風了")
        }
        
        if money < 3500 && money > 1600 {
            mindLabel.setText("呼...還罩得住")
        }
        
        if money <= 1600 {
            mindLabel.setText("切...我跟你很熟嘛，為甚麼要炸我")
        }
    }

}
