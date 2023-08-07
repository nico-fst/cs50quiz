//
//  ProgressBar.swift
//  CS50quiz
//
//  Created by Nico Stern on 07.08.23.
//

import SwiftUI

struct ProgressBar: View {
    
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {  // places elements übereinander
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.0, brightness: 0.724)/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 4)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(10)
        }
    }
}

// only in this file for the purpose of previewing!
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 10)
    }
}
