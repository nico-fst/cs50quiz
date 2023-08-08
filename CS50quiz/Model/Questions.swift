import Foundation

struct Question: Identifiable {
    var id: String
    var text: String
    var answers: [String]
    var correctAnswerIndex: Int
    var week: Int
}
