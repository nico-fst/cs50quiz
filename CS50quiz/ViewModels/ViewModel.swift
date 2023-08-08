// looked up in YT Tutorial

import Foundation
import Firebase

class ViewModel: ObservableObject {
    @Published var list = [Question]()
    
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
                        
                        // alle Documents bekommen und struct Question erstellen
                        self.list = snapshot.documents.map { d in
                            
                            // Question Element für jedes Documet erstellen
                            return Question(id: d.documentID,
                                             text: d["text"] as? String ?? "",
                                             answers: d["answers"] as? [String] ?? [],
                                             correctAnswerIndex: d["correctAnswerIndex"] as? Int ?? 0,
                                             week: d["week"] as? Int ?? 0
                                             )
                        }
                    }
                }
            } else {  // Fehler behandeln
                
            }
        }
    }
}
