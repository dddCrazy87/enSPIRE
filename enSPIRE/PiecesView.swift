import SwiftUI

struct PiecesView: View {
    var body: some View {
        
        VStack {
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){

                Rectangle()
                    .frame(height: 250)
                    .foregroundStyle(Color("YellowColor"))
                
                
                
            }
            
            
            HStack {
                Text("作品名稱：")
                    .bold()
            }
            .padding(.leading, 30)
            .padding(.top, 20)
            
            HStack {
                Text("作者：")
            }
            .padding(.leading, 50)
            
            HStack {
                Text("作品連結")
                    .bold()
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 30)
            
            
            HStack {
                Text("作品概述")
                    .bold()
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 30)

//            TextField(
//                "簡單介紹一下這個作品吧",
//                text: $description,
//                axis: .vertical
//            )
//            .frame(minHeight: 100, alignment: .top)
//            .multilineTextAlignment(.leading)
//            .foregroundStyle(.gray)
//            .padding(10)
//            .overlay{
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color("YellowColor"), lineWidth: 2)
//            }
//            .padding(.leading, 30)
//            .padding(.trailing, 30)
            
            Spacer()
            
            Button{
                    
            }label: {
                Text("上傳")
                    .frame(width: 360, height: 30)
                    .foregroundColor(.black)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("Yellow2Color"))
        }
//        .navigationTitle(name.count == 0 ? "未命名作品" : name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PiecesView()
}
