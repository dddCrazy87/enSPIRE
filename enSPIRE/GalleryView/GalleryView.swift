import Foundation
import SwiftUI

struct GalleryView: View {
    
    let gridItems = [
        GridItem(title: "img2"),
        GridItem(title: "img7"),
        GridItem(title: "img6"),
        GridItem(title: "img4"),
        GridItem(title: "img5"),
        GridItem(title: "img11"),
        GridItem(title: "img3"),
        GridItem(title: "img10"),
        GridItem(title: "img8"),
        GridItem(title: "img9"),
        GridItem(title: "img1"),
        GridItem(title: "img12")
    ]
    
    var body: some View {
        NavigationStack {
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
