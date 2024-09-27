import SwiftUI

struct ControlView: View {
    
    @Binding var speed: Double
    @Binding var isGridShowing: Bool
    @Binding var rulesShowing: Bool
    @Binding var infoShowing: Bool
    @Binding var isPlaying: Bool
    @Binding var boardModel: BoardModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ControlView(
        speed: .constant(1.0),
        isGridShowing: .constant(false),
        rulesShowing: .constant(false),
        infoShowing: .constant(false),
        isPlaying: .constant(false),
        boardModel: .constant(.defaultBoard(numRows: 25, numCols: 25))
    )
}
