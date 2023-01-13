//
//  RoundViews.swift
//  Bullseye
//
//  Created by Luis Becerra on 03/01/22.
//

import SwiftUI

struct RoundedImageViewFilled: View {
    var symbolName: String
    
    var body: some View {
        Image(systemName: symbolName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
            
    }
}

struct RoundedImageViewStroked: View {
    var symbolName: String
    
    var body: some View {
        Image(systemName: symbolName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedRectTextView: View{
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewWidth)
            .font(.title3)
            .background(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
   
}

struct RoundedTextView: View {
    var text: String
    
    var body: some View{
        Text(text)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .font(.title)
            .background(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

	

struct Light: PreviewProvider {
    
    static var previews: some View {
        VStack{
            RoundedTextView(text: "1")
            RoundedImageViewStroked(symbolName: "arrow.counterclockwise")
            RoundedImageViewFilled(symbolName: "list.dash")
            RoundedRectTextView(text: "99")
        }
    }
}

struct Dark: PreviewProvider {
    
    static var previews: some View {
        VStack(spacing: 10){
            RoundedTextView(text: "1")
            RoundedImageViewStroked(symbolName: "arrow.counterclockwise")
            RoundedImageViewFilled(symbolName: "list.dash")
                .preferredColorScheme(.dark)
            RoundedRectTextView(text: "0")
        }
        
    }
}
