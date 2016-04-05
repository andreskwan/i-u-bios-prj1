//
//  Settings+TotalShips.swift
//  Pirate Fleet
//
//  Created by Andres Kwan on 4/4/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

extension Settings {
    //func needs to be static because "RequiredShips" is static
    //and can not be used on an instance of type Settings
    static func totalShips() -> Int {
        //total needs to be initialized before used on the loop
        var total = 0
        for (_,value) in self.RequiredShips {
            total = total + value
        }
        return total
    }
}