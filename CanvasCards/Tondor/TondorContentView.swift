import SwiftUI

public struct TondorContentView: View {
  public var body: some View {
        VStack {

            TabView {
                SwipeView()
                    .tabItem {
                        Image(systemName: "flame.fill")
                    }

                Text("Placeholder for chats view")
                    .tabItem {
                        Image(systemName: "bubble.left.and.bubble.right.fill")
                    }

                Text("Placeholder for profile view")
                    .tabItem {
                        Image(systemName: "person.fill")
                    }
            }
        }
    }
}

struct TondorContentView_Previews: PreviewProvider {
    static var previews: some View {
        TondorContentView()
    }
}
