import SwiftUI

public var dblue = Color(red: 61/255, green: 65/255, blue: 109/255)
public var lblue = Color(red: 105/255, green: 135/255, blue: 164/255)

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
            .background(dblue)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
