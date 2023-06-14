import SwiftUI

struct TondorLogo: View {
    var body: some View {
        Label {
            Text("CanvasCards")
                .font(.title2)
                .bold()
        } icon: {
            Image(systemName: "flame.fill")
        }
        .foregroundColor(.accentColor)
    }
}

struct TondorLogo_Previews: PreviewProvider {
    static var previews: some View {
        TondorLogo()
            .previewLayout(.sizeThatFits)
    }
}
