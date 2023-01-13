//
//  TextViews.swift
//  Bullseye
//
//  Created by Luis Becerra on 03/01/22.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}

struct BigNumberText: View {
    var number: Int
    
    var body: some View {
        Text(String(number))
            .foregroundColor(Color("TextColor"))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
            .frame(width: 35.0)
    }
}


struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.caption)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
            .bold()
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(
                Color.white
            )
            .background(
                RoundedRectangle(cornerRadius: 12.0)
                    .foregroundColor(Color.accentColor)
            )
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View{
        Text(String(score))
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct DateText: View {
    var date: Date
    
    
    var body: some View{
        Text(formatDate(date: date))
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct BigBoldText: View {
    var text: String
    
    var body: some View{
        Text(text.uppercased())
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .kerning(2.0)
            .fontWeight(.black)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            BigBoldText(text: "Leaderboard")
            ScoreText(score: 100)
            InstructionText(text: "Instructions")
            BigNumberText(number: 99)
            SliderLabelText(text: "1")
            LabelText(text: "11")
            BodyText(text: "You've scored 200 points \n🎉🎉🎉")
            ButtonText(text: "Start New Round")
        }
        .padding()
    }
}
