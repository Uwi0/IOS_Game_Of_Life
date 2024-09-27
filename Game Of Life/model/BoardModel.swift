import Foundation

struct BoardModel {
    var numRows: Int
    var numCols: Int
    var board: [Int]
    var surviveRules: [Bool]
    var bornRules: [Bool]
    let defaultSurviveRules: [Bool] = [
        false, false, true, true, false, false,
        false,false,false
    ]
    let defaultBornRules: [Bool] = [
        false, false, false, true, false, false,
        false,false,false
    ]
    let MAX_CREATURE_AGE = 10
    
    init(numRows: Int, numCols: Int) {
        self.numRows = numRows
        self.numCols = numCols
        self.board = Array(
            repeating: 1,
            count: numRows*numCols)
        self.surviveRules = defaultSurviveRules
        self.bornRules = defaultBornRules
        self.randomBoard()
    }
    
    mutating func randomBoard() {
        for i in 0..<board.count {
            let randomElement = Int.random(in: 0..<2)
            board[i] = randomElement
        }
    }
    
    static func defaultBoard(numRows: Int, numCols: Int) -> BoardModel {
        return BoardModel(
            numRows: numRows,
            numCols: numCols)
    }
    
    func getCreature(i: Int) -> Int {
        return board[i]
    }
    
    func getCreature(i: Int, j: Int) -> Int {
        let offsetCols = (i + numCols) % numCols
        let offsetRows = (j + numRows) % numRows
        
        return board[offsetCols*numCols + offsetRows]
    }
    
    mutating func setCreature(i: Int, j: Int, creature: Int) {
        board[i*numCols+j] = creature
    }
    
    func vitality(creature: Int) -> Double {
        let nonNormalizedVitality = Double(MAX_CREATURE_AGE - creature)
        let normalizationFactor: Double = Double(MAX_CREATURE_AGE - 1)
        return nonNormalizedVitality / normalizationFactor
    }
    
    mutating func clearBoard() {
        board = Array(repeating: 0, count: numRows*numCols)
    }
    
    func countNeighbours(i: Int, j: Int) -> Int {
        var count = 0
        
        for k in [-1,0,1] {
            count += getCreature(i: i-k, j: j-1) > 0 ? 1 : 0
        }
        
        for k in [-1,1] {
            count += getCreature(i: i-k, j: j) > 0 ? 1 : 0
        }
        
        for k in [-1,0,1] {
            count += getCreature(i: i-k, j: j+1) > 0 ? 1 : 0
        }
        
        return count
    }
    
    mutating func nextGeneration() {
        var newBoard: BoardModel = self
        
        for i in 0..<numCols {
            for j in 0..<numRows {
                let count = countNeighbours(i: i, j: j)
                let creature = getCreature(i: i, j: j)
                
                if creature == 0 {
                    if bornRules[count] {
                        newBoard.setCreature(
                            i: i,
                            j: j,
                            creature: 1)
                    }
                } else {
                    if !surviveRules[count] {
                        newBoard.setCreature(
                            i: i,
                            j: j,
                            creature: 0)
                    } else {
                        let newCreatureAge = creature < MAX_CREATURE_AGE ? creature + 1 : MAX_CREATURE_AGE
                        newBoard.setCreature(i: i, j: j, creature: newCreatureAge)
                    }
                }
            }
        }
        
        self.board = newBoard.board
    }
    
}
