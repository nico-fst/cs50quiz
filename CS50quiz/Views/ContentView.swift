import SwiftUI
import CoreMotion

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()  // Instantiate ViewModel
    @State private var startQuiz = false
    @State private var selectedQuestionCount = 1 // Default value
    @State private var symbolColor: Color = dblue
    @State private var motionManager = CMMotionManager()
    
    private func changeSymbolColor() {
        let randomRed = Double.random(in: 0...1)
        let randomGreen = Double.random(in: 0...1)
        let randomBlue = Double.random(in: 0...1)
        symbolColor = Color(red: randomRed, green: randomGreen, blue: randomBlue)
    }
    
    private func startShakeDetection() {
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: .main) { accelerometerData, error in
            guard let data = accelerometerData else { return }
            let acceleration = data.acceleration
            
            // Hier kannst du die Schüttelbewegung erkennen
            if abs(acceleration.x) > 1.5 || abs(acceleration.y) > 1.5 || abs(acceleration.z) > 1.5 {
                changeSymbolColor()
            }
        }
    }
    
    var body: some View {
    NavigationView {
        VStack {
            Spacer()
            
            Image(systemName: "graduationcap.fill")
                .font(.system(size: 100))
                .foregroundColor(symbolColor)
                .padding(.bottom, 40)

            
            Text("This is the CS50 Quiz!")
                .font(.title)
                .padding(.bottom, 5)
            
            Text("by @nico_strn")
                .padding(.bottom, 60)
            
            NavigationLink(
                destination: QuizView(selectedQuestionCount: selectedQuestionCount, viewModel: viewModel),
                isActive: $startQuiz,
                label: {
                    EmptyView()
                }
            )
            
            Picker("How many questions?:", selection: $selectedQuestionCount) {
                ForEach(viewModel.questionCounts, id: \.self) { count in
                    Text("\(count) Question\(count == 1 ? "" : "s")")
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            Spacer()
            
            Button(action: {
                changeSymbolColor()
            }, label: {
                Text("Shake it!")
                    .font(.headline)
                    .foregroundColor(dblue)
            })
            .padding(.bottom, 10)
            
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
            startShakeDetection()
        }
        .onDisappear {
            motionManager.stopAccelerometerUpdates()
        }

        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
