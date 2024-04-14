//
//  ChatRoomSheetCardView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/2.
//

import SwiftUI

//struct matchingUser: Identifiable {
//    var id = UUID()
//    var mindMap:MindmapProjs
//    var title: String
//    var detail: String
//    
//}
//
//var matchingUserList = [
//    matchingUser(mindMap: MindmapProjs(nodes: [Node(text: "森林咖啡廳", children: [Node(text: "肉桂捲", children: [Node(text: "肉桂拿鐵"), Node(text: "花香")]), Node(text: "悠閒的山林度假村", children: [Node(text: "家人朋友"), Node(text: "觀光小山的觀景區")]), Node(text: "鄉村田園風")])]), title: "森林咖啡廳", detail: "為我新開幕的咖啡廳想新的靈感，目前訂的主題是森林，透過不斷連想與發想來思考咖啡聽的風格與品牌故事。"),
//    matchingUser(mindMap: MindmapProjs(nodes: [Node(text: "旅遊短片", children: [Node(text: "北歐", children: [Node(text: "極光"), Node(text: "狗狗雪橇")]), Node(text: "哈士奇", children: [Node(text: "眼睛很美"), Node(text: "有趣")]), Node(text: "好玩")]), Node(text: "旅遊行程", children: [Node(text: "戶外"), Node(text: "室內", children: [Node(text: "動態活動"), Node(text: "靜態活動")])])]), title: "旅遊短片", detail: "我要剪一個去北歐玩的短片，想邀加入多一點創意的特效和轉場。"),
//    matchingUser(mindMap: MindmapProjs(nodes: [Node(text: "重複再利用", children: [Node(text: "環保袋", children: [Node(text: "出門購物"), Node(text: "大量採購")]), Node(text: "舊衣回收", children: [Node(text: "過年大掃除"), Node(text: "喜新厭舊")])])]), title: "重複再利用", detail: "身邊有很多物品，很常用一次就丟掉，想要讓生活多一點緩寶，透過心智圖發想生活中各個事物可以重複再利用的地方與妙招。"),
//]

struct ChatRoomSheetCardView: View {
    var user: UserInfo
    @State private var showDetials: Bool = false
    @State private var offset: CGSize = .zero
    @State private var check: Bool = false
    @State var curPage: ContentView.PageController = .chat
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
//                    Rectangle()
//                        .frame(height: 250)
//                        .foregroundStyle(Color("YellowColor"))
                    MindMapView(curPage: $curPage, isPreview: true, rootNode: Node(text: "森林咖啡廳", children: [Node(text: "肉桂捲", children: [Node(text: "肉桂拿鐵"), Node(text: "花香")]), Node(text: "悠閒的山林度假村", children: [Node(text: "家人朋友"), Node(text: "觀光小山的觀景區")]), Node(text: "鄉村田園風")]))
                        .frame(height: 250)
                        .clipped()
                        .background(Color("YellowColor"))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .disabled(true)
                }
                VStack(alignment: .leading){
                    Text("森林咖啡廳")
                        .padding(.vertical)
                        .font(.system(size: 20, weight: .semibold))
                    Text("為我新開幕的咖啡廳想新的靈感，目前訂的主題是森林，透過不斷連想與發想來思考咖啡聽的風格與品牌故事。")
                        .lineLimit(1)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .font(.system(size: 15))
                    HStack{
                        Spacer()
                        Button("更多..."){
                            showDetials.toggle()
                        }
                        .padding()
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(Color.black)
                        .background(Color("Yellow2Color"))
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .offset(x: 20, y: 15)
                        .sheet(isPresented: $showDetials){
                            VStack(alignment: .leading){
                                Text("森林咖啡廳")
                                    .padding(.vertical)
                                    .font(.system(size: 20, weight: .semibold))
                                HStack{
                                    Image("PersonIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                    
                                    Text(user.userName)
                                }
                                .padding(.horizontal)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.bottom, 4)
                                HStack{
                                    Image("SuitcaseIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                    
                                    Text(user.job.joined(separator: ", "))
                                       .multilineTextAlignment(.trailing)
                                    
                                }
                                .padding(.horizontal)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.bottom, 4)
                                HStack{
                                    Image("StarIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                    
                                    Text(user.habit.joined(separator: ", "))
                                       .multilineTextAlignment(.trailing)
                                
                                }
                                .padding(.horizontal)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.bottom, 4)
                                
                                Text("為我新開幕的咖啡廳想新的靈感，目前訂的主題是森林，透過不斷連想與發想來思考咖啡聽的風格與品牌故事。")
                                    .padding()
                                    .font(.system(size: 15))
                            }
                            .padding(.horizontal, 25)
                            .padding(.vertical)
                            .presentationDetents([ .medium, .large])
                            
                        }
                        
                    }
                    
                }
                .padding()
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 5)
            .offset(offset)
            .scaleEffect(getScaleAmount())
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        withAnimation(.spring()){
                            offset = value.translation
                        }
                        
                    }
                    .onEnded{ value in
                        withAnimation(.spring()){
                            offset = .zero
                        }
                        
                    }
            )
            Spacer()
            HStack{
                Button{
                    print("x")
                    
                }label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 30, weight: .bold))
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(Color("OrangeColor"))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                .padding()
                Button{
                    coordinator.push(.preChat(user: user))
                }label: {
                    Image(systemName: "checkmark")
                        .font(.system(size: 30, weight: .bold))
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(Color.green)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                .padding()
            }
        }
        .padding()
        .padding(.top, 30)
        .background(Color("YellowColor"))
        
    }
    func getScaleAmount() -> CGFloat  {
        let maxAmount = UIScreen.main.bounds.width / 2
        let currentAmount =  abs(offset.width)
        let persenctage = currentAmount / maxAmount
        return 1.0 - min(persenctage, 0.8) * 0.6
    }
}
