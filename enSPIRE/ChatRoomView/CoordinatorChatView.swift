//
//  CoordinatorChatView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/9.
//

import SwiftUI
import Observation

// Screens that we need to navigate
enum Screens: Hashable {
    case chat(user: UserInfo)
    case addChatRoom
    case preChat(user: UserInfo)
    case chatRoom(user: UserInfo)
}

// Object that will handle all the navigation

class Coordinator: ObservableObject {
    @Published var paths = NavigationPath()

    @ViewBuilder
     func build(page: Screens) -> some View {
        switch page {
        case .chat(let user):
            ChatView(user: user)
        case .addChatRoom:
            AddChatRoomSheetView()
        case .preChat(let user):
            PreChatRoomView(user: user)
        case .chatRoom(let user):
            ChatRoomView(user: user)
        }
    }

    // add screen
    func push(_ page: Screens) {
        paths.append(page)
    }

    // remove last screen
    func pop() {
        paths.removeLast()
    }

    // go to root screen
    func popToRoot() {
        paths.removeLast(paths.count)
    }
}

struct CoordinatorChatView: View {
    @EnvironmentObject var coordinator : Coordinator
    var user: UserInfo
    
    var body: some View{
        NavigationStack(path: $coordinator.paths){
            coordinator.build(page: .chat(user: user))
                .navigationDestination(for: Screens.self){ screen in
                    coordinator.build(page: screen)
                }
        }
//        .environmentObject(Coordinator())
        
    }
}

#Preview {
    ContentView()
}
