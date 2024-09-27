import SwiftUI

struct ControlView: View {
    
    @Binding var speed: Double
    @Binding var isGridShowing: Bool
    @Binding var rulesShowing: Bool
    @Binding var infoShowing: Bool
    @Binding var isPlaying: Bool
    @Binding var boardModel: BoardModel
    
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
                ControlButtonView(
                    image: playImage,
                    action: { isPlaying.toggle()}
                )
            }
        }
    }
}

private struct ControlButtonView: View {
    
    let image: String
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                Image(systemName: image)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        )
        
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
            boardModel: .constant(.defaultBoard(numRows: 25, numCols: 25))
        )
    }
}
