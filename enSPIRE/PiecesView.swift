import SwiftUI

struct PiecesView: View {
    
    let piecesData: Pieces
    
    var body: some View {
        
        VStack {
            
            Image(piecesData.image)
                .resizable()
                .scaledToFit()
            
            ScrollView(.vertical) {
                
                HStack {
                    Text(piecesData.title)
                        .bold()
                    Spacer()
                }
                .padding(.leading, 30)
                .padding(.top, 20)
                
                HStack {
                    Text(piecesData.auther)
                    Spacer()
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
                    Text(piecesData.link)
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            if let url = URL(string: piecesData.link) {
                                UIApplication.shared.open(url)
                            }
                        }
                    Spacer()
                }
                .padding(.leading, 50)
                
                HStack {
                    Text("作品概述")
                        .bold()
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 30)
                
                Text(piecesData.description)
                    .padding(.horizontal, 40)
                    .padding(.top, 10)

                Spacer()

            }
        }
        .navigationTitle(piecesData.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PiecesView(piecesData: Pieces(title: "萬有引力", auther: "牛頓", image: "img2", description: "牛頓的萬有引力定律（英語：Newton's law of universal gravitation），通稱萬有引力定律，定律指出，兩個質點彼此之間相互吸引的作用力，是與它們的質量乘積成正比，並與它們之間的距離成平方反比。\n\n萬有引力定律是由艾薩克·牛頓稱之為歸納推理的經驗觀察得出的一般物理規律。它是古典力學的一部分，是在1687年於《自然哲學的數學原理》中首次發表的，並於1687年7月5日首次出版。當牛頓的書在1686年被提交給英國皇家學會時，羅伯特·虎克宣稱牛頓從他那裡得到了距離平方反比律。", link: "https://github.com/dddCrazy87/enSPIRE"))
    }
}
