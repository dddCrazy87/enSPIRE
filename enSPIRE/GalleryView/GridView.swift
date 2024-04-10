import SwiftUI
import ImageIO

struct GridItem: Identifiable {
    var id = UUID()
    let title: String
}

struct GridView: View {
    struct Column: Identifiable {
        let id = UUID()
        var gridItems = [GridItem]()
    }
    
    var columns = [Column]()
    
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    
    init(gridItems: [GridItem], numberOfColumns: Int, spacing: CGFloat = 10, horizontalPadding: CGFloat = 10){
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        
        var columns = [Column]()
        for _ in 0 ..< numberOfColumns{
            columns.append(Column())
        }
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numberOfColumns)
        
        for gridItem in gridItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight.first!
            for i in 1 ..< columnsHeight.count {
                let curHeight = columnsHeight[i]
                if curHeight < smallestHeight {
                    smallestHeight = curHeight
                    smallestColumnIndex = i
                }
            }
            columns[smallestColumnIndex].gridItems.append(gridItem)
            columnsHeight[smallestColumnIndex] += 100
        }
        self.columns = columns
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing){
            ForEach(columns){ column in
                LazyVStack(spacing: spacing){
                    ForEach(column.gridItems){ gridItem in
                        getItemView(gridItem: gridItem)
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
    
    func getItemView(gridItem: GridItem) -> some View {
        ZStack {
            Image(gridItem.title)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

