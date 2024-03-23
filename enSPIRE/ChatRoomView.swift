//
//  ChatRoomView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import SwiftUI

class ChatRoomViewModle: ObservableObject {
    @Published var messages = [Message]()
    
    @Published var messagesData = [
       Message(UserId: "123", text: "哈囉！你好嗎？", photoURL: "", creatAt: Data()),
       Message(UserId: "123", text: "我跟你說一件很有趣的事情喔！", photoURL: "", creatAt: Data()),
       Message(UserId: "123", text: "就是", photoURL: "", creatAt: Data())
    ]
}

struct ChatRoomView: View {
    @State private var message: String = ""
    @FocusState private var isFocused: Bool
    private var sendMessage: String = ""
    
    var body: some View {
        @StateObject var chatRoomViewModel = ChatRoomViewModle()
        
        VStack {
            Text("使用者名稱")
                .padding()
                .font(.title)
            ScrollView{
                VStack(spacing: 10) {
                    ForEach(chatRoomViewModel.messagesData){ message in
                        MessageView(message: message)
                    }
                }
                MessageView(message: Message(UserId: "123", text: "等等 我之後再說", photoURL: "", creatAt: Data()))
            }
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            HStack{
                TextField(
                        "Message",
                        text: $message
                )
                .textFieldStyle(.roundedBorder)
                .padding()
                .focused($isFocused)
                
                    
                Button {
                    isFocused = false
                    print("send")
                    
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            .padding(.horizontal)
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    ChatRoomView()
}
