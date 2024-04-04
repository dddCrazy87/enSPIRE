import SwiftUI

struct UploadPiecesView: View {
    
    @State private var name = ""
    @State private var auther = ""
    @State private var description = ""
    @State private var link = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Spacer()
            HStack {
                Spacer()
                ZStack(alignment: .bottomTrailing) {
                    Image("")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    
                    Button {
                        
                    } label: {
                        Text("上傳作品封面")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                    }
                    .background(Color.yellow)
                    .cornerRadius(8)
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Yellow2Color"))
                }
                Spacer()
            }
            
            
            HStack {
                Text("作品名稱：")
                    .frame(height: 30)
                    .bold()
                TextField("作品名稱", text: $name)
            }
            
            HStack {
                Text("作者：")
                    .padding(.leading)
                TextField("作者", text: $auther)
            }
            
            Text("作品連結")
                .frame(height: 30)
                .bold()
            
            HStack {
                Spacer()
                TextField("在這裡貼上作品連結", text: $link)
                    .frame(width: 300)
                Spacer()
            }
            
            Text("作品概述")
                .frame(height: 30)
                .bold()
            
            HStack {
                Spacer()
                TextField(
                    "簡單介紹一下這個作品吧",
                    text: $description,
                    axis: .vertical
                )
                .frame(minHeight: 100, alignment: .top)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.gray)
                .padding()
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("YellowColor"), lineWidth: 2)
                }
                Spacer()
            }
            
            Spacer()
            
            Button{
                
            }label: {
                Text("上傳")
                    .frame(width: 325, height: 30)
                    .foregroundColor(.black)
                    
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("Yellow2Color"))
        }
        .frame(width: 350)
        .navigationTitle(name.count == 0 ? "未命名作品" : name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        UploadPiecesView()
    }
}
