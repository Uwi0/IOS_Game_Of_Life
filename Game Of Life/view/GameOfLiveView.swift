import SwiftUI

struct GameOfLiveView: View {
    
    @State var board: BoardModel = .defaultBoard(numRows: 25, numCols: 25)
    @State var isGridShowing: Bool = false
    @State var speed: Double = 0.1
    @State var rulesShowing: Bool = false
    @State var infoShowing: Bool = false
    @State var isPlaying: Bool = false
    @State var disableAllButton: Bool = false
    @State var timer = Timer.publish(
        every: 0.1,
        tolerance: 0.5,
        on: .main,
        in: .common
    ).autoconnect()
    
    private let dim = 25
    
    var body: some View {
        ZStack {
            bgColor.opacity(0.6)
                .ignoresSafeArea()
            VStack {
                CoolTitleView()
                BoardView(board: $board, isGridShowing: $isGridShowing)
                    .onReceive(timer) { _ in
                        self.timer.upstream.connect().cancel()
                        timer = Timer.publish(
                            every: 0.1,
                            tolerance: 0.5,
                            on: .main,
                            in: .common
                        ).autoconnect()
                        board.nextGeneration()
                    }
                Spacer()
                ControlView(
                    speed: $speed,
                    isGridShowing: $isGridShowing,
                    rulesShowing: $rulesShowing,
                    infoShowing: $infoShowing,
                    isPlaying: $isPlaying,
                    disableAllButton: $disableAllButton,
                    board: $board
                )
            }
            .padding()
        }
    }
}

#Preview {
    GameOfLiveView()
}
