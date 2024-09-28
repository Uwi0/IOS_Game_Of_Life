import SwiftUI

struct ToggleButtonView: View {
    
    @Binding var isActive: Bool
    var font: Font = .headline
    var color: Color = .white
    let action: () -> Void
    var activeScale: Double = 1.0
    var inactiveScale: Double = 1.0
    
    private let enableName = "checkmark.square"
    private let disableName = "square.fill"
    private var imageName: String {
        isActive ? enableName : disableName
    }
    private var scale: Double {
        isActive ? activeScale : inactiveScale
    }
    
    var body: some View {
        Button(
            action: {
                isActive.toggle()
                action()
            },
            label: {
                Image(systemName: imageName)
                    .font(font)
                    .foregroundColor(color)
            }
        )
        .saturation(scale)
        .animation(.linear(duration: 0.5), value: 1)
    }
}

#Preview {
    ToggleButtonView(isActive: .constant(true), action: {})
}
