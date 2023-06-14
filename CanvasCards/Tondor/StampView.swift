import SwiftUI

struct StampView: View {
    let label: String
    let color: Color

    var body: some View {
        Text(label)
            .tracking(2.5)
            .font(.largeTitle)
            .bold()
            .textCase(.uppercase)
            .multilineTextAlignment(.center)
            .foregroundColor(color)
            .padding(10)
            .border(color, width: 4)
            .cornerRadius(4)
    }
}

struct StampView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StampView(label: "Like", color: .green)
            StampView(label: "Nope", color: .red)
            StampView(label: "Super\nlike", color: .blue)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
