import SwiftUI

struct ContentView: View {
    @State private var startQuiz = false
    @State private var selectedQuestionCount = 1 // Default value
    var questionCounts = [1, 2, 3, 4] // Available question counts
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "graduationcap.fill")
                    .font(.system(size: 100))
                    .foregroundColor(dblue) // Use PrimaryButton color
                    .padding(.bottom, 40)
                
                Text("This is the CS50 Quiz!")
                    .font(.title)
                    .padding(.bottom, 5)
                
                Text("by @nico_strn")
                    .padding(.bottom, 60)
                
                NavigationLink(
                    destination: QuizView(selectedQuestionCount: selectedQuestionCount, questions: quizData),
                    isActive: $startQuiz,
                    label: {
                        EmptyView() // NavigationLink is triggered programmatically
                    }
                )
                
                Picker("How many questions?:", selection: $selectedQuestionCount) {
                    ForEach(questionCounts, id: \.self) { count in
                        Text("\(count) Question\(count == 1 ? "" : "s")")
                    }
                }
                .pickerStyle(WheelPickerStyle()) // Use the WheelPickerStyle
                
                Spacer()
                
                PrimaryButton(text: "Start")
                    .onTapGesture {
                        startQuiz = true
                    }
                    .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 220/255, green: 237/255, blue: 255/255)) // pastel baby blue
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
