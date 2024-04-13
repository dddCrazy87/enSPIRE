//
//  EditSheetView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/29.
//

import SwiftUI

struct EditSheetView: View {
    @Binding var showEditSheet: Bool
    @State private var titleMessage: String = ""
    @State private var infoMessage: String = ""
    @State private var nickNameMessage: String = "Wayne"
    @State private var jobMessage: String = "甜點師傅"
    @State private var habitMessage: String = "品嚐甜點 下廚"
    @FocusState var isNameFocus: Bool
    @FocusState var isJobFocus: Bool
    @FocusState var isHabitFocus: Bool
    
    @State var flag = true
    @State var curPage: ContentView.PageController = .chat
    let mindMap2 = MindMapPreview(title: "適合小孩的點心食譜", des: "這是一個點心食譜", node: Node(text: "適合小孩吃的點心食譜", children: [Node(text: "甜甜的"), Node(text: "下午放學後")]))
    @Binding var mindMap:MindMapPreview
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text("資料設定")
                Spacer()
                Button{
                    showEditSheet = false
                }label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            ScrollView{
                if flag {
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                        Rectangle()
                            .frame(height: 250)
                            .foregroundStyle(Color("YellowColor"))
                        Button {
                            titleMessage = mindMap2.title
                            infoMessage = mindMap2.des
                            flag = false
                        } label: {
                            Text("其他專案")
                                .font(.system(size: 14))
                                .padding(12)
                                .background(Color("Yellow2Color"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .offset(x: -15, y: -15)
                                .foregroundColor(.black)
                        }
                    }
                }
                else {
                    MindMapView(curPage: $curPage, isPreview: true, rootNode: mindMap2.node)
                        .frame(height: 250)
                        .clipped()
                        .background(Color("YellowColor"))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .disabled(true)
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Image("PersonIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                        Text("暱稱：")
                        TextField(
                                "暱稱",
                                text: $nickNameMessage,
                                axis: .vertical
                        )
                        .focused($isNameFocus)
                    }
                    .padding(.horizontal)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.bottom, 4)
                    HStack{
                        Image("SuitcaseIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                        Text("職業：")
                        TextField(
                                "職業",
                                text: $jobMessage,
                                axis: .vertical
                        )
                        .focused($isJobFocus)
                    }
                    .padding(.horizontal)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.bottom, 4)
                    HStack{
                        Image("StarIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                        Text("興趣：")
                        TextField(
                                "興趣",
                                text: $habitMessage,
                                axis: .vertical
                        )
                        .focused($isHabitFocus)
                    }
                    .padding(.horizontal)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.bottom, 4)
                    TextField(
                            "心智圖標題",
                            text: $titleMessage,
                            axis: .vertical
                    )
                    .padding()
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.bottom, 8)
                    TextField(
                        "描述你的心智圖內容...",
                        text: $infoMessage,
                        axis: .vertical
                    )
                    .frame(minHeight: 100, alignment: .top)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.gray)
                    .padding()
                    .font(.system(size: 15))
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("YellowColor"), lineWidth: 2)
                    }
                }
                .padding(.horizontal, 25)
                .padding(.vertical)
            }
            
            Button{
                mindMap = mindMap2
                showEditSheet = false
            }label: {
                Text("儲存")
                    .frame(width: 360, height: 30)
                    .foregroundColor(.black)
                    
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("Yellow2Color"))
            .padding()
        }
        .onTapGesture {
            isJobFocus = false
            isHabitFocus = false
            isNameFocus = false
        }
    }
}

struct MyView: View {
    @State var a = true
    @State var m = MindMapPreview(title: "心智圖標題", des: "描述你的心智圖內容", node: Node(text: "選擇一個心智圖吧", children: [Node(text: "aaa"), Node(text: "aaa"), Node(text: "aaa")]))
    var body: some View {
        EditSheetView(showEditSheet: $a, mindMap: $m)
    }
}

#Preview {
    MyView()
}
