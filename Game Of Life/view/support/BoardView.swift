import SwiftUI

struct BoardView: View {
    @Binding var board: BoardModel
    @Binding var isGridShowing: Bool
    
    private var numRows: Int { board.numRow }
    private var numColumns: Int { board.numColumn }
    private var gridItemLayout: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 0), count: numRows)
    }
    private var borderColor: Color {
        isGridShowing ? .blue : .clear
    }
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 0) {
            ForEach(0..<numColumns*numRows, id: \.self) { i in
                let creature = board.getCreature(i: i)
                let vitality = board.vitatlity(creature: creature)
                let isDead = creature == 0
                let creatureColor = creatureColor(isDead, vitality)
                
                Rectangle()
                    .fill(creatureColor)
                    .aspectRatio(1, contentMode: .fit)
                    .border(borderColor)
            }
            .overlay {
                Rectangle()
                    .stroke(.pink.opacity(0.7), lineWidth: 1)
            }
            
        }
    }
    
    private func creatureColor(_ isDead: Bool, _ vitality: Double) -> Color {
        isDead ? .black : Color(red: 1, green: vitality, blue: vitality)
    }
}

#Preview {
    BoardView(
        board: .constant(.deafultBoard(numRows: 25, numCol: 25)),
        isGridShowing: .constant(false)
    )
}
