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

