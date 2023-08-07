import Foundation

struct Question {
    var text: String
    var answers: [String]
    var correctAnswerIndex: Int
}

var quizDataUnshuffled: [Question] = [
    Question(text: "Was ist die Hauptstadt von Frankreich?",
             answers: ["Berlin", "Paris", "Madrid", "Rom"],
             correctAnswerIndex: 1),

    Question(text: "Welche Programmiersprache wird oft als 'die Mutter aller Programmiersprachen' bezeichnet?",
             answers: ["C", "Java", "Python", "Fortran"],
             correctAnswerIndex: 0),

    Question(text: "Was ist eine Zeichenkette in vielen Programmiersprachen?",
             answers: ["Eine Methode", "Ein Integer-Wert", "Ein boolescher Wert", "Text"],
             correctAnswerIndex: 3),

    Question(text: "Welches Konzept ermöglicht das Erstellen neuer Klassen basierend auf bestehenden Klassen?",
             answers: ["Vererbung", "Überladung", "Polymorphismus", "Abstraktion"],
             correctAnswerIndex: 0),

    Question(text: "Was ist der Zweck von Git in der Softwareentwicklung?",
             answers: ["Datenbankverwaltung", "Grafikdesign", "Versionskontrolle", "Datenbankabfrage"],
             correctAnswerIndex: 2)
]

func shuffleQuestions(_ questions: [Question]) -> [Question] {
    return questions.shuffled()
}

var quizData = shuffleQuestions(quizDataUnshuffled)
