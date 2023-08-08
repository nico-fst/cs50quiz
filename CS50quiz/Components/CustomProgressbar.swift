import SwiftUI

struct ProgressBarView: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: geometry.size.width, height: 8)
                
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(Color.blue)
                    .frame(width: min(geometry.size.width * progress, geometry.size.width), height: 8)
                    .animation(.linear)
            }
        }
    }
}
