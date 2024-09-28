import SwiftUI

struct GlowingCardModefier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 500)
            .background(
                LinearGradient(
                    colors: [.blue, .green],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .cornerRadius(20)
                .glow(color: .black, radius: 5)
                .glow(color: .purple, radius: 15)
            )
    }
}

extension View {
    func glow(color: Color, radius: CGFloat) -> some View {
        self.shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}
