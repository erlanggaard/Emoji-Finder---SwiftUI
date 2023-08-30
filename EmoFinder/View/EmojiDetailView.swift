//
//  EmojiDetailView.swift
//  EmoFinder
//
//  Created by Erlangga Ardiansyah on 30/08/23.
//

import SwiftUI

struct EmojiDetailView: View {
    // MARK: - PROPERTIES
    let emojiDetails: EmojiModel
    
    
    // MARK: - BODY
    var body: some View {
        Spacer()
        
        VStack {
            ZStack {
                Circle()
                    .frame(width: 200, height: 200)
                    .opacity(0.1)
                    .overlay {
                        Circle()
                            .stroke(Color.black, lineWidth: 3)
                    }
                Text(emojiDetails.emoji)
                    .font(.system(size: 140))
            } // ZStack
            
            Text(emojiDetails.name)
                .font(.system(size: 30))
                .fontDesign(.monospaced)
                .fontWeight(.bold)
            
            Text(emojiDetails.description)
                .font(.system(size: 20))
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .padding()
            
        } // VStack
        Spacer()
    }
}

// MARK: - PREVIEW
#Preview {
    EmojiDetailView(emojiDetails: EmojiModel(emoji: "👾",
                                             name: "Alien Monster",
                                             description: "A friendly-looking, tentacled space creature with two eyes.")
    )
}
