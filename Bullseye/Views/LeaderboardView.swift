//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Luis Alfredo Becerra Jaime on 10/01/23.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0.0){
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                    .padding(.top)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach (game.leaderboardEntries.indices){
                            i in

                            let entryData = game.leaderboardEntries[i]
                            RowView(index: i + 1, score: entryData.score, date: entryData.date)
                        }
                    }
                }
                
            }
        }
        
    }
}

struct RowView: View {
    var index: Int
    var score: Int
    var date: Date
    
    var body: some View {
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.dateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct HeaderView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View{
        let compactHeader = verticalSizeClass == .regular &&
        horizontalSizeClass == .compact
        ZStack{
            HStack {
                let bigboldText = BigBoldText(text: "Leaderboard")
                    
                if compactHeader {
                    bigboldText.padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    print("close")
                    leaderboardIsShowing = false
                }) {
                    RoundedImageViewFilled(symbolName: "xmark")
                }
                
            }
            .padding(.trailing)
            .padding(.leading)
        }
        
    }
}

struct LabelView: View {
    var body: some View{
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.scoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.dateColWidth)
        }
        .padding()
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            LeaderboardView(leaderboardIsShowing: .constant(false), game: .constant(Game(testMode: true)))
        }
    }
}
