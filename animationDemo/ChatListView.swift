//
//  ChatListView.swift
//  animationDemo
//
//  Created by ali madhoun on 04/08/2024.
//

import SwiftUI

struct ChatListView: View {
    let chats: [Chat]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(chats) { chat in
                    ChatRowView(chat: chat)
                        .padding(.horizontal)
                        .bottomUpAppear(delay: Double(chats.firstIndex(where: { $0.id == chat.id }) ?? 1) * 0.1)
                }
            }
        }
    }
}



extension View {
    func bottomUpAppear(delay: Double) -> some View {
        self.modifier(BottomUpAppear(delay: delay))
    }
}
