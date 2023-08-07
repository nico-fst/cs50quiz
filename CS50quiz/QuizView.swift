import SwiftUI

struct QuizView: View {
    var selectedQuestionCount: Int
    var questions: [Question]
    
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswerIndex: Int? = nil
    @State private var isCorrectAnswer = false
    @State private var correctAnswerIndex: Int? = nil
    @State private var correctAnswerCount = 0
    @State private var isQuizFinished = false
    @State private var showNextButton = false
    
    init(selectedQuestionCount: Int, questions: [Question]) {
        self.selectedQuestionCount = selectedQuestionCount
        self.questions = Array(questions.prefix(selectedQuestionCount))
    }

    var body: some View {
        VStack {
            ProgressView(value: Double(currentQuestionIndex), total: Double(selectedQuestionCount))
                .padding(.top, 20)
            
            if !isQuizFinished {
                    Spacer()
                    
                    VStack(spacing: 140) {
                        Text(questions[currentQuestionIndex].text)
                            .font(.title)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 20) {
                            ForEach(0..<questions[currentQuestionIndex].answers.count, id: \.self) { index in
                                Button(action: {
                                    selectedAnswerIndex = index
                                    checkAnswer()
                                    showNextButton = true
                                }) {
                                    Text(questions[currentQuestionIndex].answers[index])
                                        .font(.headline)
                                        .foregroundColor(Color.black)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(getColorForAnswerBox(index: index))
                                        )
                                        .opacity(selectedAnswerIndex == nil || selectedAnswerIndex == index ? 1 : 0.5)
                                        .shadow(color: selectedAnswerIndex == index ?
                                                    (isCorrectAnswer ? Color.green : Color.red) : Color.black.opacity(0.2),
                                                radius: 5, x: 0, y: 2)
                                        .animation(.easeInOut(duration: 0.3))
                                }
                                .disabled(selectedAnswerIndex != nil)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.horizontal, 5)
                    .shadow(radius: 5)
                }
            
                Spacer()
                Spacer()
            
            if showNextButton {
                PrimaryButton(text: "Next")
                    .onTapGesture {
                        nextQuestion()
                    }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .overlay(
            Group {
                if isQuizFinished {
                    SummaryView(correctAnswerCount: correctAnswerCount, totalQuestionCount: selectedQuestionCount)
                }
            }
        )
        .background(Color(red: 220/255, green: 237/255, blue: 255/255))
    }
    
    func checkAnswer() {
        if selectedAnswerIndex == questions[currentQuestionIndex].correctAnswerIndex {
            isCorrectAnswer = true
            correctAnswerCount += 1
        } else {
            isCorrectAnswer = false
            correctAnswerIndex = questions[currentQuestionIndex].correctAnswerIndex
        }
    }
    
    func nextQuestion() {
        selectedAnswerIndex = nil
        isCorrectAnswer = false
        correctAnswerIndex = nil
        showNextButton = false
        currentQuestionIndex += 1
        
        if currentQuestionIndex >= selectedQuestionCount {
            isQuizFinished = true
        }
    }
    
    private func getColorForAnswerBox(index: Int) -> Color {
        if selectedAnswerIndex == index {
            return isCorrectAnswer ? Color(red: 208/255, green: 255/255, blue: 222/255) : Color(red: 255/255, green: 214/255, blue: 214/255) // green else red
        } else if correctAnswerIndex == index {
            if isCorrectAnswer {
                return Color(red: 180/255, green: 255/255, blue: 180/255) // slightly different green tone for correct answer
            } else {
                return Color(red: 208/255, green: 255/255, blue: 214/255) // slightly different green tone for correct answer when wrong
            }
        } else {
            return Color.white
        }
    }

}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(selectedQuestionCount: 3, questions: quizData)
    }
}
