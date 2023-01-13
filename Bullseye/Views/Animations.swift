//
//  Animations.swift
//  Bullseye
//
//  Created by Luis Alfredo Becerra Jaime on 10/01/23.
//

import SwiftUI

struct Animations: View {

    @State private var animate = false
    
    var body: some View {
        VStack(spacing: 10){
            RoundedImageViewStroked(symbolName: "arrow.counterclockwise")
            if(animate) {
                RoundedImageViewFilled(symbolName: "list.dash")
                    .transition(.scale)
            }
            RoundedRectTextView(text: "0")
            RectAnim(animate: $animate)
            Button(action: {
                withAnimation(.easeInOut ,{
                    animate.toggle()
                })
            }) {
                Text("Animate")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .cornerRadius(16.0)
            }
        }
    }
}

struct RectAnim: View {
    @Binding var animate: Bool
    
    var body: some View{
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
            .foregroundColor(Color.blue)
            .padding()
            .frame(width: animate ? 240.0 : 100.0, height: 200)
    }
}

struct Animations_Previews: PreviewProvider {
    
    static var previews: some View {
        Animations()
    }
}
