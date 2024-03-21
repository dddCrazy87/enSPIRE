import SwiftUI

struct GridItem: Identifiable {
    var id = UUID()
    
    let height: CGFloat
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
            columnsHeight[smallestColumnIndex] += gridItem.height
        }
        self.columns = columns
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing){
            ForEach(columns){ column in
                LazyVStack(spacing: spacing){
                    ForEach(column.gridItems){ gridItem in
                        Rectangle()
                            .foregroundStyle(Color.blue)
                            .frame(height: gridItem.height)
                            .overlay {
                                Text(gridItem.title)
                                    .font(.system(size: 20, weight: .bold))
                            }
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
}

#Preview {
    var gridItems = [GridItem]()
    let randomHeight = CGFloat.random(in: 100 ... 400)
    gridItems.append(GridItem(height: randomHeight, title: "0"))
    return GridView(gridItems: gridItems, numberOfColumns: 2)
}
