//
//  ChatRowView.swift
//  animationDemo
//
//  Created by ali madhoun on 04/08/2024.
//

import SwiftUI

struct ChatRowView: View {
    let chat: Chat

    var body: some View {
        HStack {
            Image(chat.userImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text(chat.userName)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(chat.latestMessage)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            .padding(.leading, 8)

            Spacer()
        }
        .padding(.vertical, 8)
    }
}
