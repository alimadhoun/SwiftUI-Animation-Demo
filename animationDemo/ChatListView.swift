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

struct BottomUpAppear: ViewModifier {
    let delay: Double
    
    @State private var isVisible = false

    func body(content: Content) -> some View {
        content
            .offset(y: isVisible ? 0 : 200)
            .scaleEffect(isVisible ? 1 : 0.5, anchor: .bottom)
            .opacity(isVisible ? 1 : 0)
            .animation(Animation.easeOut(duration: 0.5).delay(delay), value: isVisible)
            .onAppear {
                isVisible = true
            }
    }
}

extension View {
    func bottomUpAppear(delay: Double) -> some View {
        self.modifier(BottomUpAppear(delay: delay))
    }
}
