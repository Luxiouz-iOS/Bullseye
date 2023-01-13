//
//  PointsView.swift
//  Bullseye
//
//  Created by Luis Alfredo Becerra Jaime on 10/01/23.
//

import SwiftUI

struct PointsView: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        let points = game.points(sliderValue: Int(sliderValue))
        
        VStack(spacing: 10){
            InstructionText(text: "The slider value is")
            BigNumberText(number: Int(sliderValue))
            BodyText(text: "You scored \(points) points\n🎉🎉🎉")
            Button(action: {
                withAnimation{
                    alertIsVisible = false
                    sliderValue = 50;
                }
                game.startNewRound(points: points )
            }){
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300.0)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: 10.0, x: 5.0, y: 5.0)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(game: .constant(Game()), sliderValue: .constant(50), alertIsVisible: .constant(true))
    }
}
