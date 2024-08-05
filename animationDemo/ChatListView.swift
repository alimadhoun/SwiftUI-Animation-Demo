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
                ForEach(chats.indices, id: \.self) { index in
                    
                    let chat = chats[index]
                    ChatRowView(chat: chat)
                        .padding(.horizontal)
                        .bottomUpAppear(delay: Double(index) * 0.1)
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
