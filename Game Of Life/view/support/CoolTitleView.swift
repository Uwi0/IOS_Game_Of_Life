import SwiftUI

struct CoolTitleView: View {
    private let gradientColors: [Color] = [.white, .pink, .red]
    var body: some View {
        LinearGradient(colors: gradientColors, startPoint: .leading, endPoint: .trailing)
            .frame(height: 50)
            .mask {
                Text("Game Of Life")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        
    }
}

#Preview {
    CoolTitleView()
}
