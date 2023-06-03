import SwiftUI

struct ProfileInfoView: View {
    let profile: Profile

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // Profile information (name, age etc)
            HStack {
                Text(profile.name)
                    .font(.title)
                    .bold()

                Text(profile.age)
                    .font(.title2)

                if profile.isVerified {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .background(.white)
                        .clipShape(Circle())
                        .accessibilityLabel("Verified user")
                }
            }

            Label {
                Text("Recently online")
            } icon: {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.green)
            }
            .padding(.vertical, 5)

            if let location = profile.location {
                Label("Lives in \(location)", systemImage: "house")
            }

            if let distanceKilometers = profile.distanceKilometers {
                Label("\(distanceKilometers)km away from you", systemImage: "safari")
            }
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
