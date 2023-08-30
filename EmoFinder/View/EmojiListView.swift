//
//  EmojiListView.swift
//  EmoFinder
//
//  Created by Erlangga Ardiansyah on 30/08/23.
//

import SwiftUI

struct EmojiListView: View {
    
    // MARK: - PROPERTIES
    @State private var searchText: String = ""
    
    private var emojiSearchResults: [EmojiModel] {
        let results = EmojiProvider.all()
        
        if searchText.isEmpty {
            return results
        } else {
            return results.filter { index in
                index.name.lowercased().contains(searchText.lowercased()) || index.emoji.contains(searchText.lowercased())
            }
        }
    }
    
    
    
    // MARK: - BODY
    var body: some View {
        
        NavigationStack {
            List(emojiSearchResults) { result in
                NavigationLink(destination: {
                    EmojiDetailView(emojiDetails: result)
                }){
                    HStack {
                        Text(result.emoji)
                            .font(.system(size: 80))
                            .frame(width: 100, height: 100)
                        
                        VStack(alignment: .leading) {
                            Text(result.name)
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.top, 8)
                                .padding(.bottom, 8)
                            
                            Text(result.description)
                                .font(.footnote)
                                .foregroundStyle(Color.gray)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .truncationMode(.tail)
                                .padding(.trailing, 30)
                        }
                    }
                }
            }
            .navigationTitle("Emo Finder")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search Emoji's?")
        }
    }
}

// MARK: - PREVIEW
#Preview {
    EmojiListView()
}
