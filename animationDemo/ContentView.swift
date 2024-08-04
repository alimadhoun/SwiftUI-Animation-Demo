//
//  ContentView.swift
//  animationDemo
//
//  Created by ali madhoun on 04/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var shouldShowChatsView: Bool = false
    
    var body: some View {
        
        VStack {
            Button("Get Chats") {
                shouldShowChatsView = true
            }
        }
        .fullScreenCover(isPresented: $shouldShowChatsView, content: {
            ChatListContainerView()
        })
    }
}

struct ChatListContainerView: View {
    
    let chats: [Chat] = [
        Chat(id: UUID(), userImage: "user1", userName: "Alice", latestMessage: "Hey, how are you?"),
        Chat(id: UUID(), userImage: "user2", userName: "Bob", latestMessage: "Are you coming to the party?"),
        Chat(id: UUID(), userImage: "user3", userName: "Charlie", latestMessage: "Let's catch up soon."),
        Chat(id: UUID(), userImage: "user4", userName: "Diana", latestMessage: "Meeting at 10 AM."),
        Chat(id: UUID(), userImage: "user5", userName: "Eve", latestMessage: "Great job on the project!")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ChatListView(chats: chats)
                    .navigationTitle("Chats")
            }
        }
    }
}

struct Chat: Identifiable {
    let id: UUID
    let userImage: String
    let userName: String
    let latestMessage: String
}

#Preview {
    ContentView()
}
