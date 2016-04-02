//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
//        <#WRITE YOUR CODE HERE!#>
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 7, y: 0), isVertical: true)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        let smallShip = Ship(length: 2, location: GridLocation(x: 3,y: 0), isVertical: false)
        human.addShipToGrid(smallShip)
        let largeShip = Ship(length: 4, location: GridLocation(x: 0,y: 4), isVertical: false)
        human.addShipToGrid(largeShip)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 0, y: 5), isVertical: false)
        human.addShipToGrid(extraLargeShip)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = 0                
        
        return finalScore
    }
}