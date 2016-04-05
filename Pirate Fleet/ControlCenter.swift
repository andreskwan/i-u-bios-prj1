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

/*
 adding Mines
 after adding the properties, error stops, that means that the 
 protocol _Mine_ was conformed
 */
struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        
        let smallShip = Ship(length: 2, location: GridLocation(x: 3,y: 0), isVertical: false)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 7, y: 0), isVertical: true)
        let largeShip = Ship(length: 4, location: GridLocation(x: 0,y: 4), isVertical: false)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 0, y: 5), isVertical: false)
        
        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        
        //mines
        let mine1 = Mine(location: GridLocation(x: 1, y: 1), explosionText: "Cabum Motherfucker!!!")
        let mine2 = Mine(location: GridLocation(x: 1, y: 2), explosionText: "Die!!!")
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        var totalShips = 0
        //Refactor - should be an extension for Settings
        for (_,value) in Settings.RequiredShips {
            totalShips = totalShips + value
        }
        let enemyShipsSunk = totalShips - gameStats.enemyShipsRemaining //totalShips - remainingShips
        print("enemy ships sunk: \(enemyShipsSunk)")
        let humanShipsRemaining = totalShips - gameStats.humanShipsSunk
        print("human ships remaining: \(humanShipsRemaining)")
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        print("number of guesses: \(numberOfGuesses)")
        let enemyShipsSunkBonus = enemyShipsSunk * gameStats.sinkBonus
        print("sink bonus: \(gameStats.sinkBonus)\nenemy ships sunk bonus: \(enemyShipsSunkBonus) ")
        let humanShipsRemainigBonus = humanShipsRemaining * gameStats.sinkBonus
        print("human ships remainig bonus: \(humanShipsRemainigBonus) ")
        finalScore = enemyShipsSunkBonus + humanShipsRemainigBonus - (numberOfGuesses * gameStats.guessPenalty)
        return finalScore
    }
}