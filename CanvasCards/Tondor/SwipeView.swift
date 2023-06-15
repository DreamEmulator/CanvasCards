import SwiftUI

struct SwipeView: View {
    @State var profiles: [Profile] = Profile.all.reversed()

    var body: some View {
        ZStack {
            DoneView {
                withAnimation { profiles = Profile.all }
            }

            ForEach(profiles) { profile in
                ProfileCardView(profile: profile) { likeType in
                    withAnimation { removeProfile(profile) }
                    onLike(profile, type: likeType)
                }
                .padding()
            }
        }
    }

    func removeProfile(_ profile: Profile) {
        guard let index = profiles.firstIndex(of: profile) else { return }

        profiles.remove(at: index)
    }

    func onLike(_ profile: Profile, type likeType: LikeType) {
        switch likeType {
        case .like:
            print("You liked \(profile.name)")
        case .dislike:
            print("You disliked \(profile.name)")
        case .superlike:
            print("You super-liked \(profile.name)")
        }
    }
}

private struct DoneView: View {
    let reload: () -> Void
    var body: some View {
        VStack {
            Text("You've filled in all the cards!")

            Button("Refresh") {
                reload()
            }.buttonStyle(.borderedProminent)
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
