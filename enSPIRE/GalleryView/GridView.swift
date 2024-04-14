import SwiftUI
import ImageIO

struct GridView: View {
    struct Column: Identifiable {
        let id = UUID()
        var gridItems = [Pieces]()
    }
    
    var columns = [Column]()
    
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    
    init(gridItems: [Pieces], numberOfColumns: Int, spacing: CGFloat = 10, horizontalPadding: CGFloat = 10){
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        
        var columns = [Column]()
        for _ in 0 ..< numberOfColumns{
            columns.append(Column())
        }
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numberOfColumns)
        
        for piece in gridItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight.first!
            for i in 1 ..< columnsHeight.count {
                let curHeight = columnsHeight[i]
                if curHeight < smallestHeight {
                    smallestHeight = curHeight
                    smallestColumnIndex = i
                }
            }
            columns[smallestColumnIndex].gridItems.append(piece)
            columnsHeight[smallestColumnIndex] += 100
        }
        self.columns = columns
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing){
            ForEach(columns){ column in
                LazyVStack(spacing: spacing){
                    ForEach(column.gridItems){ piece in
                        getItemView(gridItem: piece)
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
    
    func getItemView(gridItem: Pieces) -> some View {
        ZStack {
            NavigationLink {
                PiecesView(piecesData: gridItem)
            } label: {
                Image(gridItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

