//
//  ChatView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import SwiftUI

struct ChatView: View {
    @State var tabIndex = 0
    @State private var showEditSheet: Bool = false
    @Binding var curPage: ContentView.PageController
    var body: some View {
        NavigationStack {
            VStack{
                ChatingProjectSettingView()
                CustomTopTabBar(tabIndex: $tabIndex)
                if tabIndex == 0 {
                    NormalChatView(curPage: $curPage)
                }
                else {
                    CrossFieldChatView(curPage: $curPage)
                }
            }
        }
        .navigationTitle("討論室")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup{
                Button{
                    showEditSheet.toggle()
                }label: {
                   Image(systemName: "square.and.pencil")
                }
                .sheet(isPresented: $showEditSheet){
                    EditSheetView(showEditSheet: $showEditSheet)
                }
                NavigationLink{
                    AddChatRoomSheetView(curPage: $curPage)
                }label: {
                   Image(systemName: "person.crop.circle.badge.plus")
                }
            
            }
        }
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
                    Text(text)
                        .foregroundStyle(Color.black)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 180)
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
                    .frame(width: 150)
                    .padding()
                    .offset(y: 15)
            }
        }
    }
}


#Preview {
    ContentView()
}
