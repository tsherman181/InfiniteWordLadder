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
            Color.blue
            VStack{
                HStack{
                    Button{
                        gameinfo.currPage = .menu
                    }label:{
                        Label("", systemImage: "list.dash")
                            .font(.system(size: 20, weight: .bold, design: .default))
                    }
                    Spacer()
                }
                .padding()
                Text("What is a word ladder?")
                    .font(.title)
                Text("A word ladder is a word puzzle game where given a clue, you must guess its corresponding four letter word. After that, you are given another clue. That clue's answer is one letter different than the previous clues answer.")
                    .padding()
                Text("For example")
                    .padding()
                HStack{
                    VStack{
                        Text("Clue: Pot starter")
                        Text("Answer: ANT") + Text("E")
                            .foregroundColor(.black)
                            .font(Font.body.bold())
                    }
                    Image(systemName: "arrow.forward")
                    VStack{
                        Text("Clue: Aardvark's diet")
                        Text("Answer: ANT") + Text("S")
                            .foregroundColor(.black)
                            .font(Font.body.bold())
                    }
                    .padding()
                }
                Button("Ready to play the game?"){
                    gameinfo.currPage = .IWL
                }
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
                .frame(width: deviceWidth/1.5, alignment: .center)
                .background(Color.white)
                .cornerRadius(40)
                .foregroundColor(Color.blue)
                .padding()
            }
            .foregroundColor(.white)
            .opacity(opacity)
            .animation(.easeOut, value: opacity)
            .scaleEffect(scale)
            .animation(.easeOut, value: scale)
        }
        .ignoresSafeArea()
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
            .environmentObject(GameInfo())
    }
}
}
