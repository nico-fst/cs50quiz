import SwiftUI

struct SummaryView: View {
    var correctAnswerCount: Int
    var totalQuestionCount: Int
    
    var body: some View {
        VStack {
            Image(systemName: "flag.checkered.2.crossed")
                .font(.system(size: 100))
                .foregroundColor(Color(red: 76/255, green: 82/255, blue: 101/255)) // Use PrimaryButton color
                .padding(.bottom, 40)
            
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
