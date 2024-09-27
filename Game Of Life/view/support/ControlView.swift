import SwiftUI

struct ControlView: View {
    
    @Binding var speed: Double
    @Binding var isGridShowing: Bool
    @Binding var rulesShowing: Bool
    @Binding var infoShowing: Bool
    @Binding var isPlaying: Bool
    @Binding var disableAllButton: Bool
    @Binding var board: BoardModel
    
    private var playImage: String {
        isPlaying ? "play" : "pause"
    }
    
    private let MAX_SPEED: Double = 3
    
    var body: some View {
        VStack {
            Slider(value: $speed, in: 0 ... MAX_SPEED)
                .accentColor(.red)
                .padding(.horizontal)
            HStack(spacing: 15) {
                ButtonView(
                    image: playImage,
                    action: { isPlaying.toggle()}
                )
                
                ButtonView(
                    image: "arrow.counterclockwise",
                    action: {
                        board.randomBoard()
                    }
                )
                
                ButtonView(
                    image: "clear",
                    action: {
                        board.clearBoard()
                    }
                )
                
                ButtonView(
                    image: "grid",
                    action: {
                        isGridShowing.toggle()
                        disableAllButton.toggle()
                    }
                )
                
                ButtonView(
                    image: "text.book.closed",
                    action: {
                        rulesShowing.toggle()
                    }
                )
                
                ButtonView(
                    image: "info.circle",
                    action: {
                        infoShowing.toggle()
                    }
                )
            }
        }
    }
}

#Preview {
    ZStack {
        bgColor.ignoresSafeArea()
        ControlView(
            speed: .constant(1.0),
            isGridShowing: .constant(false),
            rulesShowing: .constant(false),
            infoShowing: .constant(false),
            isPlaying: .constant(true),
            disableAllButton: .constant(false),
            board: .constant(.defaultBoard(numRows: 25, numCols: 25))
        )
    }
}
