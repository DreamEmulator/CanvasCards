import SwiftUI

struct ProfileInfoView: View {
    let profile: Profile

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {

            Label {
                Text("Business Model Canvas")
            } icon: {
                Image(systemName: "circle.star")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.yellow)
            }
            .padding(.vertical, 5)
        }
        .padding()
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom))
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView(profile: .maru)
            .previewLayout(.sizeThatFits)
    }
}
