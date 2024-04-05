//
//  AddChatRoomSheetView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/2.
//

import SwiftUI

struct AddChatRoomSheetView: View {
    @State var tabIndex = 0
    var body: some View {
        NavigationStack{
            VStack{
                CustomSheetTopTabBar(tabIndex: $tabIndex)
                if tabIndex == 0 {
                    LoadingScreeenView(user: UserInfo(UserId: "123", userName: "okok", photo: "", job: ["老師", "商品設計師"], habit: ["看書", "釣魚"] ))
                }
                else {
                    LoadingScreeenView(user: UserInfo(UserId: "123", userName: "okok", photo: "", job: ["老師", "商品設計師"], habit: ["看書", "釣魚"] ))
                }
            }
        }
        .navigationTitle("新增討論室")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CustomSheetTopTabBar: View {
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

struct SheetTabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    let namespace: Namespace.ID
    
    var body: some View {
        VStack{
            if isSelected {
                ZStack{
                    Text(text)
                        .foregroundStyle(Color.black)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 100)
                        .padding()
                        .padding(.bottom)
                        .background(Color("YellowColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .matchedGeometryEffect(id: "highlightmenuitem", in: namespace)
                }
                .offset(y: 25)
            }
            else {
                Text(text)
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 17, weight: .bold))
                    .frame(width: 100)
                    .padding()
                    .offset(y: 15)
            }
        }
    }
}

#Preview {
    NavigationStack{
        ChatView()
    }
}
