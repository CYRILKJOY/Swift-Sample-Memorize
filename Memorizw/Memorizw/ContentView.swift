//
//  ContentView.swift
//  Memorizw
//
//  Created by Cyril K Joy on 16/01/23.
//

import SwiftUI
struct ContentView: View {
    var cards = ["♥︎","♠︎","♦︎","♣︎"]
    @State var cardCount = 2
    var body: some View{
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(cards[0..<cardCount], id: \.self ) {card in Cardview(content: card).aspectRatio(2/3,contentMode: .fit)
                    }
                }
                HStack{
                    add
                    Spacer()
                    remove
                }
            }
        }.padding(20)
            .foregroundColor(.teal)
        }
        
    
    var add : some View {
            Button{
                if cardCount < 20 {
                    cardCount += 1
                }
            }
            label : {
                VStack{
                    Text("Add")
                }}
    }
        var remove : some View {
            Button{
                if cardCount > 1 {
                    cardCount -= 1
                }
            }
            label : {
                VStack{
                    Text("Delete")
                }}
        }
    }
        
        
        
        struct Cardview: View {
            var content : String
            @State var isfaceup: Bool = true
            var body : some View{
                ZStack{
                    let shape =  RoundedRectangle(cornerRadius: 20)
                    if  isfaceup{
                        shape.fill()
                            .foregroundColor(.white)
                        shape.stroke()
                        Text(content)
                            .font(.largeTitle)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    }
                    else {
                        shape
                            .fill()
                    }
                }
                .onTapGesture {
                    isfaceup = !isfaceup
                }
            }
        }
        
        
        
        
        
        
        
        
        
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
