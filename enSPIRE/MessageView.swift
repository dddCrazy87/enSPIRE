//
//  MessageView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    
    var body: some View {
        if message.isFromCurrentUser() {
            VStack(alignment: .trailing){
                HStack(alignment: .top)
                {
                    Text(message.text)
                        .font(.system(size: 14))
                        .foregroundStyle(Color.black)
                        .frame(alignment: .topTrailing)
                        .padding()
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 1.5)
                }
                .frame(maxWidth: 260, alignment: .trailing)
                .padding(.leading, 100)
            }
        }
        else{
            VStack(alignment: .leading){
                HStack
                {
                    Image("PersonIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 15))
                        .foregroundStyle(Color.yellow)
                        .padding(8)
                        .background(Color.black)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text(message.text)
                        .font(.system(size: 14))
                        .foregroundStyle(Color.black)
                        .frame(alignment: .topLeading)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 1.5)
                        
                }
                .frame(maxWidth: 260, alignment: .leading)
                .padding(.trailing, 100)
            }
        }
    }
}

#Preview {
    MessageView(message: Message(UserId: "123", text: "哈囉！你好嗎？", photoURL: "", creatAt: Data()))
}
