import SwiftUI

struct RulesView: View {
    
    @Binding var survivalRules: [Bool]
    @Binding var bornRules: [Bool]
    @Binding var rulesShowing: Bool
    @Binding var disableButton: Bool
    
    var defaultSurvivalRules: [Bool]
    var defaultBornRules: [Bool]
    let count: Int = 9
    let CARD_ROTATE_DUTATION = 0.2
    
    @State private var done: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Label(
                title: {
                    Text("Rules")
                        .font(.title)
                        .fontWeight(.bold)
                },
                icon: {
                    Image(systemName: "text.book.closed")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
            )
            .padding()
            VStack(alignment: .leading, spacing: 20) {
                Text("SurviveCheckBox")
                Text("Born Check Box")
                Spacer()
                HStack {
                    Button(
                        action: {
                            survivalRules = defaultSurvivalRules
                            bornRules = defaultBornRules
                        },
                        label: {
                            Text("Default")
                                .font(.headline)
                        }
                    )
                    .buttonStyle(RoundButtonStyle())
                    Spacer()
                    Button(
                        action: {
                            withAnimation(.linear(duration: CARD_ROTATE_DUTATION)) {
                                done = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + CARD_ROTATE_DUTATION) {
                                rulesShowing.toggle()
                                disableButton = false
                            }
                        },
                        label: { Text("Ok")
                            .font(.headline)}
                    )
                    .buttonStyle(RoundButtonStyle())
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    ZStack {
        RulesView(
            survivalRules: .constant([false, false, false, true, false, false,false,false,false]),
            bornRules: .constant([false, false, true, true, false, false,false,false,false]),
            rulesShowing: .constant(true),
            disableButton: .constant(true),
            defaultSurvivalRules: [false, false, false, true, false, false,false,false,false],
            defaultBornRules: [false, false, true, true, false, false,false,false,false]
        )
    }
}
