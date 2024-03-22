import SwiftUI

struct MindMapView: View {
    var body: some View {
        // main view
        VStack {
            Text("hello world!")
        }
        .navigationTitle("title")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MindMapView()
    }
}
