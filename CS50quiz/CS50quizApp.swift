//
//  CS50quizApp.swift
//  CS50quiz
//
//  Created by Nico Stern on 07.08.23.
//

import SwiftUI
import FirebaseCore

@main
struct CS50quizApp: App {

    init() {  // aus Youtube Tutorial
        FirebaseApp.configure()  // von FireBase vorgegeben
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
