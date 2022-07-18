//
//  Instructions.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/24/22.
//

import SwiftUI

struct Instructions: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    
    @State private var angle = 0.0
    @State private var opacity = 1.0
    @State private var scale = 1.0
    
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    var body: some View {
        ZStack{
            Color(gameinfo.backgroundColor).ignoresSafeArea()
            VStack{
                if (gameinfo.font == "Wingdings"){
                    MenuBookButton()
                        .environmentObject(gameinfo)
                }
                else{
                    MenuButton()
                        .environmentObject(gameinfo)
                }
                Text("What is a word ladder?")
                    .font(Font.custom(gameinfo.font, size: 28))
                Text("A word ladder is a word puzzle game where given a clue, you must guess its corresponding four letter word. After that, you are given another clue with an answer one letter different than the previous one. Here's an example:")
                    .font(Font.custom(gameinfo.font, size: 17))
                    .padding()
                HStack{
                    VStack{
                        Text("Clue: Pot starter")
                            .font(Font.custom(gameinfo.font, size: 17))
                        Text("Answer: ANT")
                            .font(Font.custom(gameinfo.font, size: 17))
                        +
                        Text("E")
                            .foregroundColor(.black)
                            .font(Font.custom(gameinfo.font, size: 17))
                            .font(Font.body.bold())
                    }
                    Image(systemName: "arrow.forward")
                    VStack{
                        Text("Clue: Aardvark's diet")
                            .font(Font.custom(gameinfo.font, size: 17))
                        Text("Answer: ANT")
                            .font(Font.custom(gameinfo.font, size: 17))
                            .font(Font.body.bold())
                        + Text("S")
                            .font(Font.custom(gameinfo.font, size: 17))
                            .font(Font.body.bold())
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                Text("If you need help, hit the hint button and you will get a different hint for that word!")
                    .font(Font.custom(gameinfo.font, size: 17))
                    .padding(.horizontal)
                Text("If you are out of guesses, you can hit the give up button. It will tell you the word but deduct 1 point :(")
                    .font(Font.custom(gameinfo.font, size: 17))
                    .padding()
                Button("Ready to play the game?"){
                    gameinfo.currPage = .IWL
                }
                .font(Font.custom(gameinfo.font, size: 17))
                .padding()
                .frame(width: deviceWidth/1.5, alignment: .center)
                .background(Color.white)
                .cornerRadius(40)
                .foregroundColor(Color(gameinfo.backgroundColor))
                .padding()
            }
            .foregroundColor(.white)
            .opacity(opacity)
            .animation(.easeOut, value: opacity)
            .scaleEffect(scale)
            .animation(.easeOut, value: scale)
        }
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
            .environmentObject(GameInfo())
    }
}
}
