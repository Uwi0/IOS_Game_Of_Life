import SwiftUI

struct RulesCheckBoxView: View {
    let name: String
    @Binding var rules: [Bool]
    
    private var color: (Int) -> Color {
        { index in
            rules[index] ? .blue : .green
        }
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.title3)
                .fontWeight(.bold)
            HStack {
                ForEach(0..<9, id: \.self) { index in
                    VStack(spacing: 3) {
                        ToggleButtonView(
                            isActive: $rules[index],
                            action: {},
                            activeScale: 1.5
                        )
                        Text("\(index)")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    ZStack {
        bgColor.ignoresSafeArea()
        RulesCheckBoxView(
            name: "Survival",
            rules: .constant([false, false, false, true, false, false,false,false,false])
        )
    }
}
