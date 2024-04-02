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
    @State private var showAddChatRoomSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
                ChatingProjectSettingView()
                CustomTopTabBar(tabIndex: $tabIndex)
                if tabIndex == 0 {
                    NormalChatView()
                }
                else {
                    CrossFieldChatView()
                }
            }
        }
        .navigationTitle("討論室")
        .navigationBarTitleDisplayMode(.inline)
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
                Button{
                    showAddChatRoomSheet.toggle()
                }label: {
                   Image(systemName: "person.crop.circle.badge.plus")
                }
                .sheet(isPresented: $showAddChatRoomSheet){
                    Text("This is the expandable bottom sheet.")
                        .presentationDetents([ .medium, .large])
                        .presentationBackground(.thinMaterial)
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
