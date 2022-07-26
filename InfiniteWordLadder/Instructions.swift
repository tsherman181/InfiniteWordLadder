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
            GeometryReader { geo in
                VStack{
                    if (gameinfo.font == "Wingdings"){
                        MenuBookButton()
                            .environmentObject(gameinfo)
                            .frame(height: geo.size.height/12)
                    }
                    else{
                        MenuButton()
                            .environmentObject(gameinfo)
                            .frame(height: geo.size.height/12)
                    }
                    Text("What is a word ladder?")
                        .font(Font.custom(gameinfo.font, size: 28))
                        .frame(width: geo.size.width*0.95, height: geo.size.height/8, alignment: .center)
                    Text("A word ladder is a game when given a clue, you must guess the corresponding four letter word. After guessing the word correctly, you are given a new clue for a new word. That word is one letter different than the previous word. Example:")
                        .font(Font.custom(gameinfo.font, size: 17))
                        .frame(width: geo.size.width*0.9, height: geo.size.height/7, alignment: .topLeading)
                    //wont work for ipod unless 3.98
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
                    }
                    .frame(width: geo.size.width*0.95, height: geo.size.height/6, alignment: .center)
                    Text("If you hit the hint button you will get a different clue for that word.")
                        .font(Font.custom(gameinfo.font, size: 17))
                        .frame(width: geo.size.width*0.9, height: geo.size.height/8, alignment: .topLeading)
                    Text("If you hit the give up button it will tell you the word but deduct a point.")
                        .font(Font.custom(gameinfo.font, size: 17))
                        .frame(width: geo.size.width*0.9, height: geo.size.height/8, alignment: .topLeading)
                    Button("Ready to play the game?"){
                        gameinfo.currPage = .IWL
                    }
                    .font(Font.custom(gameinfo.font, size: 17))
                    .frame(width: deviceWidth/1.5, height: geo.size.height/12, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(40)
                    .foregroundColor(Color(gameinfo.backgroundColor))
                    .frame(width: geo.size.width*0.95, height: geo.size.height/8, alignment: .center)
                }
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
