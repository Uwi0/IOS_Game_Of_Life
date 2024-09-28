import SwiftUI

struct InfoView: View {
    @Binding var infoShowing: Bool
    @Binding var disableAllButtons: Bool
    
    @State private var done: Bool = false
    
    private let CARD_ROTATE_DURATION = 0.2
    
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Label(title: {
                    Text("Information")
                        .font(.title)
                        .fontWeight(.bold)
                }, icon: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding(.vertical)
                })
                .padding()
                
                VStack(alignment: .leading, spacing: 20) {
                                    
                    Text("John Horton Conway FRS (26 December 1937 – 11 April 2020) was an English mathematician active in the theory of finite groups, knot theory, number theory, combinatorial game theory and coding theory. He also made contributions to many branches of recreational mathematics, most notably the invention of the cellular automaton called the Game of Life.")
                        .font(.headline)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.1)
                        .padding()
                    Spacer()
                }.padding()
                
            }
            .modifier(GlowingCardModefier())
            .onTapGesture {
                infoShowing.toggle()
                disableAllButtons = false
            }

        }
}

#Preview {
    InfoView(infoShowing: .constant(true), disableAllButtons: .constant(false))
}
