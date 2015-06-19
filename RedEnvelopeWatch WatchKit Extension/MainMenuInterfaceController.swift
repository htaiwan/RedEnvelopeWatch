//
//  MainMenuInterfaceController.swift
//  RedEnvelopeWatch
//
//  Created by htaiwan on 6/9/15.
//  Copyright (c) 2015 htaiwan. All rights reserved.
//

import WatchKit
import Foundation


class MainMenuInterfaceController: WKInterfaceController,SubMenuInterfaceControllerDelegate {

    @IBOutlet weak var friend: WKInterfaceLabel!
    @IBOutlet weak var hotel: WKInterfaceLabel!
    var friendString : String?
    var hotelString : String?
    
    var friendLevel : Int?
    var hotelLevel : Int?
    var money : Int?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if let string = friendString {
            friend.setText(string)
        }
        if let string = hotelString {
            hotel.setText(string)
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func selectFriendShipLevel() {
        var context = Context()
        context.delegate = self
        context.style = .Friend
        
        pushControllerWithName("SubMenuInterfaceController", context: context)
    }
    
    @IBAction func selectHotelLavel() {
        var context = Context()
        context.delegate = self
        context.style = .Hotel
        pushControllerWithName("SubMenuInterfaceController", context: context)
    }
    
    @IBAction func getResult() {
        if let flevel = friendLevel {
            if let hlevel = hotelLevel {
                println("f -> \(flevel)")
                println("h -> \(hlevel)")
                var context = Context()
                context.money = 1000+400*flevel+200*hlevel
                println("紅包-->>\(context.money!)")
                pushControllerWithName("ResultInterfaceController", context: context)
            }
        }
    }
    
    
    func didSeletStyle(style:Style, string:String, index:Int) {
        println("\(string)")
        if style == .Friend {
            friendString = string
            friendLevel = index + 1
        }
        if style == .Hotel {
            hotelString = string
            hotelLevel = index + 1
        }
        
    }
}
