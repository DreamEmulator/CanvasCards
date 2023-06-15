import SwiftUI

struct ProfileCardView: View {
    let profile: Profile
    let onRemove: (LikeType) -> Void
    @State private var offset = CGSize.zero

    var body: some View {
        ZStack(alignment: .bottom) {
            ProfileInfoView(profile: profile)

            // Stamps for like/dislike/superlike that fade in as you swipe
            Group {
                StampView(label: "Card ready", color: .green)
                    .rotationEffect(.degrees(-15))
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .opacity(Double(offset.width / 50))

                StampView(label: "To do", color: .red)
                    .rotationEffect(.degrees(15))
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .opacity(abs(min(Double(offset.width / 50), 0)))

                StampView(label: "Key card", color: .blue)
                    .rotationEffect(.degrees(-15))
                    .padding(.bottom, 80)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .opacity(abs(min(Double(offset.height / 100), 0)))
            }
        }
        .background(
          LinearGradient(colors: [.white, .mint], startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(8)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 2, y: offset.height)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { gesture in
                    if offset.width > 100 {
                        onRemove(.like)
                    } else if offset.width < -100 {
                        onRemove(.dislike)
                    } else if offset.height < -100 {
                        onRemove(.superlike)
                    } else {
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
                }
        )
    }
}

struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardView(profile: .maru) { _ in }
            .previewLayout(.sizeThatFits)
    }
}
