//
//  PreChatRoomView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/5.
//

import SwiftUI

struct PreChatRoomView: View {
    var user: userInfo
    @State private var isActive: Bool = false
    var body: some View {
        if isActive {
            ChatRoomView(user: user)
        }else {
            VStack{
                Button{
                    isActive.toggle()
                }label: {
                    Text("開始討論")
                        .font(.system(size: 26, weight: .semibold))
                        .padding(68)
                        .foregroundStyle(Color.black)
                        .background(Color("Yellow2Color"))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                
            }
        }
        
    }
}

#Preview {
    PreChatRoomView(user: userInfo(UserId: "123", userName: "okok", photo: "",isCrossField: false, job: ["老師", "商品設計師"], habit: ["看書", "釣魚"] ))
}
