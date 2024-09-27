import SwiftUI

struct ButtonView: View {
    
    let image: String
    
    let action: () -> Void
    var font: Font = .largeTitle
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
            action: {
                
            },
            color: .red
        )
}
