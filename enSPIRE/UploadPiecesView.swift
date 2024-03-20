import SwiftUI

struct UploadPiecesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("")
                    .resizable()
                    .frame(width: 300, height: 220)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Button {
                
            } label: {
                Text("選擇作品檔案")
                    .font(.system(size: 23))
                    .foregroundColor(.black)
                    .frame(width: 170, height: 40)
                    .background(Color.yellow)
            }
            Text("作品名稱")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(height: 30)
            Text("作者")
                .font(.system(size: 23))
                .padding(.leading)
            
            Text("作品名稱")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(height: 30)
            Text("米南德講過，俗知憂能老，為視鏡中絲。這段話令我陷入了沈思。作品概述的發生，到底需要如何實現，不作品概述的發生，又會如何產生。不難發現，問題在於該用什麼標準來做決定呢？緬甸曾說過，沉睡的蝦，會被急流捲走。強烈建議大家把這段話牢牢記住。")
                .font(.system(size: 18))
                .frame(width: 300)
                .padding(.leading)
        }
        .frame(width: 320)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .navigationTitle("作品名稱")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        UploadPiecesView()
    }
}
