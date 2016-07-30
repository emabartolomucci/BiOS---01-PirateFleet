//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Modified by Emanuele Bartolomucci on 2016/7/30.
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

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {

        // 5 ships' initialization
        let smallShip01 = Ship (length: 2, location: GridLocation(x:4, y:0), isVertical: false)
        let mediumShip01 = Ship (length: 3, location: GridLocation(x:1, y:6), isVertical: false)
        let mediumShip02 = Ship (length: 3, location: GridLocation(x:7, y:1), isVertical: true)
        let largeShip01 = Ship (length: 4, location: GridLocation(x:0, y:1), isVertical: false)
        let xLargeShip02 = Ship (length: 5, location: GridLocation(x:5, y:2), isVertical: true)
        
        // 2 mines' initialization
        let mine01 = Mine (location: GridLocation(x: 2, y: 3), explosionText: "BOOM! You just hit a mine!")
        let mine02 = Mine (location: GridLocation(x: 4, y: 7), explosionText: "WATCH OUT! You hit a mine!")
        
        // 5 ships' call
        human.addShipToGrid(smallShip01)
        human.addShipToGrid(mediumShip01)
        human.addShipToGrid(mediumShip02)
        human.addShipToGrid(largeShip01)
        human.addShipToGrid(xLargeShip02)

        // 2 mines' call
        human.addMineToGrid(mine01)
        human.addMineToGrid(mine02)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        // Every player starts with 5 ships, as per given game instructions
        let startingShipNumber = 5;
        
        finalScore = (( startingShipNumber - gameStats.enemyShipsRemaining ) * gameStats.sinkBonus ) + (( startingShipNumber - gameStats.humanShipsSunk ) * gameStats.shipBonus ) - (( gameStats.numberOfMissesByHuman + gameStats.numberOfHitsOnEnemy ) * gameStats.guessPenalty )
        
        return finalScore
    }
}