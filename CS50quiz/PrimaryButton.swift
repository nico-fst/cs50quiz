//
//  PrimaryButton.swift
//  CS50quiz
//
//  Created by Nico Stern on 07.08.23.
//

import SwiftUI

struct PrimaryButton: View {
    
    var text: String
    var redValue: Double = 76/255.0
    var greenValue: Double = 82/255.0
    var blueValue: Double = 101/255.0
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(Color(red: redValue, green: greenValue, blue: blueValue))
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
