//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Luis Becerra on 03/01/22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6){ ring in
                let radius = Double(ring) * 50.0
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(0.8), Color("RingColor").opacity(0.0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300)
                        
                    )
                    .frame(width: radius * 2, height: radius * 2)
            }
            
        }
        .opacity(colorScheme == .dark ?  0.1 : 0.3)
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false
    
    var body: some View{
        HStack{
            Button(action: {
                withAnimation{
                    game.restart()
                }
            }) {
                RoundedImageViewStroked(symbolName: "arrow.counterclockwise")
            }
            
            Spacer()
            Button(action: {
                withAnimation{
                    leaderboardIsShowing = true
                }
            }) {
                RoundedImageViewFilled(symbolName: "list.dash")
            }
            .sheet(isPresented: $leaderboardIsShowing, content: {
                LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
            })
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View{
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}
struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View{
        VStack(spacing: 5.0){
            LabelText(text: title)
            RoundedRectTextView(text: text)
        }
        
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
