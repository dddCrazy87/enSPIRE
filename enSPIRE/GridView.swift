import SwiftUI

struct GridView: View {
    var spacing: CGFloat = 10
    var body: some View {
        HStack(alignment: .top, spacing: spacing){
            LazyVStack(content: {
                ForEach(1...10, id: \.self) { count in
                    /*@START_MENU_TOKEN@*/Text("Placeholder \(count)")/*@END_MENU_TOKEN@*/
                }
            })
        }
    }
}

#Preview {
    GridView()
}
