import SwiftUI

struct RulesView: View {
    
    @Binding var survivalRules: [Bool]
    @Binding var bornRules: [Bool]
    @Binding var rulesSHowing: Bool
    @Binding var disableButton: Bool
    
    var defaultSurvivalRules: [Bool]
    var defaultBornRules: [Bool]
    let count: Int = 9
    let CARD_ROTATE_DUTATION = 0.2
    
    @State private var done: Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RulesView(
        survivalRules: .constant([false, false, false, true, false, false,false,false,false]),
        bornRules: .constant([false, false, true, true, false, false,false,false,false]),
        rulesSHowing: .constant(true),
        disableButton: .constant(true),
        defaultSurvivalRules: [false, false, false, true, false, false,false,false,false],
        defaultBornRules: [false, false, true, true, false, false,false,false,false]
    )
}
