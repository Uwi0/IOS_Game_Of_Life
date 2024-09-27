import Foundation

struct BoardModel {
    var numRow: Int
    var numColumn: Int
    var board: [Int]
    var surviveRules: [Bool]
    var bordRules: [Bool]
    
    let defaultSurviveRules: [Bool] = [
        false, false, true, true, false, false,
        false,false,false
    ]
    
    let defaultBornRules: [Bool] = [
        false, false, false, true, false, false,
        false,false,false
    ]
    let MAX_CREATURE_AGE: Int = 10
    
    init(numRow: Int, numColumn: Int) {
        self.numRow = numRow
        self.numColumn = numColumn
        self.board = Array(repeating: 1, count: numRow * numColumn)
        self.surviveRules = defaultSurviveRules
        self.bordRules = defaultBornRules
        self.randomBoard()
    }
    
    mutating func randomBoard() {
        for i in 0..<board.count {
            let randomElement = Int.random(in: 0..<2)
            board[i] = randomElement
        }
    }
    
    static func deafultBoard(numRows: Int, numCol: Int) -> BoardModel {
        return BoardModel(numRow: numRows, numColumn: numCol)
    }
    
    func getCreature(i: Int) -> Int {
        return board[i]
    }
    
    func vitatlity(creature: Int) -> Double {
        let nonNormalized = CDouble(MAX_CREATURE_AGE - creature)
        let normalizationFactor: Double = Double(MAX_CREATURE_AGE - 1)
        return nonNormalized / normalizationFactor
    }
}
