//
//  ContentView.swift
//  MemoryGame_PG
//
//  Created by student on 27/04/2024.
//

import SwiftUI


struct ContentView: View {
    var emojis = ["🥸","🥶","🤭","🥲","🎃","🤓","🤯","😇","😉","😍"]
    @State var cards = ["🥸","🥶","🤭","🥲","🎃","🤓","🤯","😇","😉","😍"]
    
    let columns = [GridItem(.adaptive(minimum:120))]
    var cardDisplay: some View {
        ScrollView {
            LazyVGrid(columns: columns,spacing: 10){
                ForEach(cards,id: \.self){
                    content in CardView(content: content)
                    
                }
                .aspectRatio(2/3,contentMode: .fit)
            }.foregroundColor(.blue)
                .padding()
        }
            
    }
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                cardDisplay
            
            HStack {
                Spacer()
                Button(action: {
                    self.adjustCardNumber(by: 2, symbol: "+")
                }) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .disabled(cards.count >= 10)
                Spacer()
                Button(action: {
                    self.adjustCardNumber(by: -2, symbol: "-")
                }) {
                    Image(systemName: "minus.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .disabled(cards.count <= 2)
                Spacer()
            }
            .padding()
               }
        
           }
        
           func adjustCardNumber(by offset: Int, symbol: String) {
               let adjustedCount = cards.count + offset
               if adjustedCount >= 2 && adjustedCount <= 10 {
                   if offset > 0 {
                       addCards(count: offset, adjustedCount: adjustedCount)
                   } else if offset < 0 {
                       removeCards(count: -offset)
                   }
               }
           }
        
    func addCards(count: Int,adjustedCount: Int) {
               for i in 0..<count {
                   let newCard = emojis[adjustedCount-i-1]
                       cards.append(newCard)
               }
           }
        
           func removeCards(count: Int) {
               cards.removeLast(min(count, cards.count - 2))
           }
       }

#Preview {
    ContentView()
}
