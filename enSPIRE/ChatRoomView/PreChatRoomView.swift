//
//  PreChatRoomView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/5.
//

import SwiftUI

struct PreChatRoomView: View {
    var user: userInfo
    @StateObject var CrossFieldUserListModle = crossFieldUserListModle()
    @StateObject var UserListModle = userListModle()
    var body: some View {
        
        VStack{
            Spacer()
            VStack(alignment: .leading){
                Text("森林咖啡廳")
                    .font(.system(size: 25, weight: .semibold))
                Text("okok")
                    .font(.system(size: 18, weight: .regular))
                    .padding(.vertical, 1)
                    .foregroundStyle(Color.gray)
            }
            .padding()
            .frame(width: 300, alignment: .leading)
            NavigationLink{
                ChatRoomView(user: user)
                
            }label: {
                Text("開始討論")
                    .font(.system(size: 26, weight: .semibold))
                    .padding(68)
                    .foregroundStyle(Color.black)
                    .background(Color("Yellow2Color"))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .onAppear(){
                appendUser()
            }
            
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.1),  Color.gray.opacity(0.3)]), startPoint: .center, endPoint: .bottom)
        )
        
    }
    func appendUser() {
        if user.isCrossField {
            CrossFieldUserListModle.usersListData.append(user)
        } else {
            UserListModle.usersListData.append(user)
        }
        print(CrossFieldUserListModle.usersListData)
        print(UserListModle.usersListData)
    }
}

#Preview {
    PreChatRoomView(user: userInfo(UserId: "123", userName: "okok", photo: "",isCrossField: false, job: ["老師", "商品設計師"], habit: ["看書", "釣魚"] ))
}
