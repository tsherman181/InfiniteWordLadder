//
//  Correct.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/23/22.
//

import SwiftUI

struct Correct: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @State private var angle = 0.0
    @State private var opacity = 0.0
    @State private var scale = 0.0
    @State private var num = -1
    
    let correctText = ["Correct! Good job!", "I didn't know you were a word genius!", "Amazing job!", "You didn't just Google that did you?", "WOW! Just wow!", "Okay know-it-all!"]
    //MARK: Add more here when you think of new things
    //MARK: Additionally, add 2-3 animations to make this more fun!
    
    
    
    var body: some View {
        ZStack{
            Color(gameinfo.backgroundColor).ignoresSafeArea()
            VStack{
                if(num == 1){
                    Text(correctText[Int.random(in: 0..<correctText.count)])
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(Font.custom(gameinfo.font, size: 34))
                        .rotationEffect(.degrees(angle))
                        .opacity(opacity)
                        .scaleEffect(scale)
                }
                else{
                    Text(correctText[Int.random(in: 0..<correctText.count)])
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(Font.custom(gameinfo.font, size: 34))
                        .scaleEffect(scale)
                }
            }
        }
        .onAppear{
            let num = Int.random(in: 0..<2)
            //print(num)
            //print(angle)
            if (num == 1){
                withAnimation{
                    angle += 720.0
                    opacity += 1.0
                    scale += 0.8
                }
            }
            else{
                withAnimation{
                    scale += 0.8
                    angle += 180
                    angle -= 180
                }
            }
        }
    }
}




struct Correct_Previews: PreviewProvider {
    static var previews: some View {
        Correct()
            .environmentObject(GameInfo())
    }
}
