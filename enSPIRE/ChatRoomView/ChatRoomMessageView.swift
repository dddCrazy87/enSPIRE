//
//  ChatRoomMessageView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/1.
//
import SwiftUI

class ChatRoomViewModle: ObservableObject {
    @Published var messages = [Message]()
    
    @Published var messagesData = [
        Message(UserId: "123", text: "哈囉！你好嗎？", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: false),
       Message(UserId: "123", text: "我跟你說一件很有趣的事情喔！", photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: false),
       Message(UserId: "123", text: "就是", photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: false),
       Message(UserId: "123", text: "哈囉！你好嗎？", photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: false),
       Message(UserId: "123", text: "我跟你說一件很有趣的事情喔！", photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: false),
       Message(UserId: "123", text: "就是", photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: false),
       Message(UserId: "123", text: "哈囉！你好嗎？", photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: false),
       Message(UserId: "123", text: "我跟你說一件很有趣的事情喔！", photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: false),
       Message(UserId: "123", text: "就是", photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: false)
    ]
}

struct ChatRoomMessageView: View {
    @State private var message: String = ""
    private var sendMessage: String = ""
    @StateObject var chatRoomViewModel = ChatRoomViewModle()

    var body: some View {
            VStack {
                ScrollView{
                    Spacer()
                    VStack(spacing: 10) {
                        ForEach(chatRoomViewModel.messagesData){ message in
                            MessageView(message: message)
                        }
                    }
                }
                .padding()
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                HStack{
                    TextField(
                            "Message",
                            text: $message,
                            axis: .vertical
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                        
                    Button {
                        print("send")
                        chatRoomViewModel.messagesData.append(Message(UserId: "123", text: message, photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: true))
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundStyle(Color.black)
                    }
                }
                .padding(.horizontal)
            }
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationStack {
        ChatRoomMessageView()
    }
}

