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
                        Rectangle()
                            .fill(color(index))
                            .cornerRadius(5)
                            .frame(width: 25, height: 25)
                        Text("\(index + 1)")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    RulesCheckBoxView(
        name: "Survival",
        rules: .constant([false, false, false, true, false, false,false,false,false])
    )
}
