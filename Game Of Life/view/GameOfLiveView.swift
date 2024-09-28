import SwiftUI

struct GameOfLiveView: View {
    
    @State var board: BoardModel
    @State var speed: Double
    @State var isGridShowing: Bool = false
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
    
    let DIM = 25
    let MIN_SECONDS: Double = 0.01
    let MAX_SECONDS: Double = 3.0
    let MAX_SPEED: Double = 10.0
    var MAX_TIME: Double {
        MAX_SPEED / 2
    }
    
    init() {
        board = BoardModel(
            numRows: DIM,
            numCols: DIM)
        
        let a = -(MAX_SECONDS - MIN_SECONDS) / MAX_SPEED
        
        speed = 1 / a * (1.5 - MAX_SECONDS)
    }
    
    var body: some View {
        ZStack {
            bgColor.opacity(0.6)
                .ignoresSafeArea()
            VStack {
                CoolTitleView()
                BoardView(board: $board, isGridShowing: $isGridShowing)
                    .onReceive(timer) { _ in
                        let a = -(MAX_SECONDS - MIN_SECONDS) / MAX_SPEED
                        self.timer.upstream.connect().cancel()
                        timer = Timer.publish(
                            every: a * speed + MAX_SECONDS,
                            tolerance: 0.5,
                            on: .main,
                            in: .common
                        ).autoconnect()
                        if isPlaying {
                            board.nextGeneration()
                        }
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
            
            if rulesShowing {
                RulesView(
                    survivalRules: $board.surviveRules,
                    bornRules: $board.bornRules,
                    rulesShowing: $rulesShowing,
                    disableButton: $disableAllButton,
                    defaultSurvivalRules: board.defaultSurviveRules,
                    defaultBornRules: board.bornRules
                )
            }
        }
    }
}

#Preview {
    GameOfLiveView()
}
