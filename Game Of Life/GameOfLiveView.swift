import SwiftUI

struct GameOfLiveView: View {
    var body: some View {
        ZStack {
            bgColor.opacity(0.6)
                .ignoresSafeArea()
            VStack {
                Text("Cool Title View")
                Text("Board View")
                Spacer()
                Text("Controll View")
            }
            .padding()
        }
    }
}

#Preview {
    GameOfLiveView()
}
