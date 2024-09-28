import SwiftUI

struct RoundButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.red)
            .frame(width: 60)
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.red, lineWidth: 1)
            }
    }
}

