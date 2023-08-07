import SwiftUI

struct SummaryView: View {
    var correctAnswerCount: Int
    var totalQuestionCount: Int
    
    var body: some View {
        VStack {
            Text("Finished!")
                .font(.title)
                .padding()
            
            Text("You answered \(correctAnswerCount) out of \(totalQuestionCount) questions correctly.")
                .padding()
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(correctAnswerCount: 8, totalQuestionCount: 10)
    }
}
