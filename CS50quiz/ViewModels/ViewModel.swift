// looked up in YT Tutorial

import Foundation
import Firebase

class ViewModel: ObservableObject {
    @Published var listUnshuffled = [Question]()
    @Published var list = [Question]()
    
    var questionCounts = [1, 2, 5, 10, 25, 50, 100] // Available question counts
    var availableQuestionCounts: [Int] {
        guard listUnshuffled.count > 0 else {
            return []
        }
        
        let quarterCount = Int(Double(listUnshuffled.count) / 4.0)
        let halfCount = Int(Double(listUnshuffled.count) / 2.0)
        let threeQuarterCount = Int(Double(listUnshuffled.count) * 3.0 / 4.0)
        
        var counts = [2, quarterCount, halfCount, threeQuarterCount, listUnshuffled.count]
        counts = counts.filter { $0 > 0 && $0 <= listUnshuffled.count }
        counts = Array(Set(counts)) // Remove duplicates
        counts.sort()
        return counts
    }
    
    func getData() {
        // Referenz zur Datenbank bekommen
        let db = Firestore.firestore()
        
        // Documents an best. Weg lesen
        db.collection("cs50x-complete").getDocuments { snapshot, error in
            
            // Fehler?
            if error == nil {  // keine Fehler
                
                if let snapshot = snapshot {
                    
                    // update list property in the main thread
                    DispatchQueue.main.async {
                        self.listUnshuffled = snapshot.documents.map { d in
                            // Erstelle Question-Element für jedes Document
                            return Question(id: d.documentID,
                                            text: d["text"] as? String ?? "",
                                            answers: d["answers"] as? [String] ?? [],
                                            correctAnswerIndex: d["correctAnswerIndex"] as? Int ?? 0,
                                            week: d["week"] as? Int ?? 0
                            )
                        }
                        self.list = self.listUnshuffled.shuffled() // Mische die Fragen
                    }
                }
            } else {  // Fehler behandeln
                
            }
        }
    }
}
