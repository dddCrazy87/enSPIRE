//
//  ChatView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import SwiftUI

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.12
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY ))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
        }
    }
}

struct ChatView: View {
    @State var tabIndex = 0
    @Namespace private var namespace
    var body: some View {
        NavigationStack {
            VStack{
                CustomTopTabBar(tabIndex: $tabIndex)
                if tabIndex == 0 {
                    NormalChatView()
                        .matchedGeometryEffect(id: "highlightmenuitem", in: namespace)
                }
                else {
                    CrossFieldChatView()
                        .matchedGeometryEffect(id: "highlightmenuitem", in: namespace)
                }
            }
        }
        .navigationTitle("討論室")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    private func onButtonTapped(index: Int) {
        withAnimation(.easeInOut) {
            tabIndex = index
        }
    }
    @Namespace private var menuItemTransition
    
    var body: some View {
        HStack(alignment: .center) {
            TabBarButton(text: "一般討論室", isSelected: .constant(tabIndex == 0), namespace: menuItemTransition)
                .onTapGesture { onButtonTapped(index: 0) }
            TabBarButton(text: "跨領域討論室", isSelected: .constant(tabIndex == 1), namespace: menuItemTransition)
                .onTapGesture { onButtonTapped(index: 1) }
        }
    }
}

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    let namespace: Namespace.ID
    
    var body: some View {
        VStack{
            if isSelected {
                ZStack{
                    Trapezoid()
                        .offset(y:20)
                        .frame(width: 195, height: 60)
                        .foregroundStyle(Color("YellowColor"))
                        .matchedGeometryEffect(id: "Trapezoid", in: namespace)

                    Text(text)
                        .frame(width: 120)
                        .padding()
                        .background(Color("YellowColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .matchedGeometryEffect(id: "highlightmenuitem", in: namespace)
                }
            }
            else {
                Text(text)
                    .frame(width: 120)
                    .padding()
            }
        }
    }
}


#Preview {
    NavigationStack{
        ChatView()
    }
}


//.toolbar{
//    ToolbarItemGroup(placement: .topBarTrailing) {
//        Button{
//            addChatRoomToggle = true
//            print("add")
//        }label: {
//            Image(systemName: "person.badge.plus")
//                .foregroundStyle(Color.black)
//        }
//        .sheet(isPresented: $addChatRoomToggle) {
//            VStack {
//                Text("新增討論室")
//                    .font(.system(size: 25, weight: .bold))
//                    .padding(.top, 40)
//                    .padding(.bottom, 10)
//                Text("選擇你要新增的討論室的類型")
//                    .foregroundStyle(Color.secondary)
//                    .font(.system(size: 14))
//                HStack{
//                    Button{
//                        print("add")
//                    } label: {
//                        Text("+ 新增討論")
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 10)
//                    }
//                    .font(.system(size: 16))
//                    .foregroundStyle(Color.black)
//                    .background(Color.yellow)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    
//                    Button{
//                        print("add")
//                    } label: {
//                        Text("+ 新增跨領域討論")
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 10)
//                    }
//                    .font(.system(size: 16))
//                    .foregroundStyle(Color.black)
//                    .background(Color.yellow)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    
//                }
//                .padding()
//                Spacer()
//            }
//            .presentationDetents([ .medium, .large])
//        }
//    }
//}
