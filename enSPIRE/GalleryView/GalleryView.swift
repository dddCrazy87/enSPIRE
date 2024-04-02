import Foundation
import SwiftUI

struct GalleryView: View {
    var body: some View {
        var gridItems = [GridItem]()
        for i in 0 ..< 50{
            let randomHeight = CGFloat.random(in: 80 ... 400)
            gridItems.append(GridItem(height: randomHeight, title: String(i)))
        }
        return NavigationStack {
            ScrollView{
                GridView(gridItems: gridItems, numberOfColumns: 2)
            }
            .padding()
        }
        .navigationTitle("展覽室")
        .navigationBarTitleDisplayMode(.inline)
    }
}
    

#Preview {
    NavigationStack {
        GalleryView()
    }
}
