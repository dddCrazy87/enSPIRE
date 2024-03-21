import Foundation
import SwiftUI

struct GalleryView: View {
    var body: some View {
        var gridItems = [GridItem]()
        for i in 0 ..< 50{
            let randomHeight = CGFloat.random(in: 80 ... 400)
            gridItems.append(GridItem(height: randomHeight, title: String(i)))
        }
        return ScrollView{
            GridView(gridItems: gridItems, numberOfColumns: 2)
        }
    }
}
    

#Preview {
    GalleryView()
}
