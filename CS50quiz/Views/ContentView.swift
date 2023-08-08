import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()  // Instantiate ViewModel
    @State private var startQuiz = false
    @State private var selectedQuestionCount = 1 // Default value
    
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
                    destination: QuizView(selectedQuestionCount: selectedQuestionCount, viewModel: viewModel),  // Pass ViewModel instance
                    isActive: $startQuiz,
                    label: {
                        EmptyView()
                    }
                )
                
                Picker("How many questions?:", selection: $selectedQuestionCount) {
                    ForEach(viewModel.availableQuestionCounts, id: \.self) { count in
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
            .onAppear {
                viewModel.getData()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
