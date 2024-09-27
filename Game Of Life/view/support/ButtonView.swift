import SwiftUI

struct ButtonView: View {
    
    let image: String
    let font: Font
    let action: () -> Void
    var color: Color = .white
    
    var body: some View {
        Button(
            action: action,
            label: {
                Image(systemName: image)
                    .font(.largeTitle)
                    .foregroundStyle(color)
            }
        )
        
    }
}

#Preview {

        ButtonView(
            image: "pause",
            font: .largeTitle,
            action: {
                
            },
            color: .red
        )
}
