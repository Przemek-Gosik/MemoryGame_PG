//
//  CardView.swift
//  MemoryGame_PG
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct CardView: View {
    var content: String
@State private var isFaceUp = false
    
    var body: some View {
        Group {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
                    .overlay(
                        Text(content)
                            .font(.largeTitle)
                    )
                    .onTapGesture {
                        withAnimation {
                            isFaceUp.toggle()
                        }
                    }
            }
            else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue)
                    .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 2)
                    )
                    .onTapGesture {
                        withAnimation {
                            isFaceUp.toggle()
                        }
                    }
            }
        }
        .opacity(isFaceUp ? 1 : 0.5)
    }
}


#Preview {
    CardView(content: "😆")
}
