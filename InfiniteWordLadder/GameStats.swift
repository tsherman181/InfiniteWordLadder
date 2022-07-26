//
//  GameStats.swift
//  InfiniteWordLadder
//
//  Created by Erika Webb on 7/26/22.
//

import SwiftUI

struct GameStats: View {
    @EnvironmentObject var gameinfo: GameInfo
    var body: some View {
        ZStack {
            Color(gameinfo.backgroundColor).ignoresSafeArea()
            GeometryReader { geo in
                VStack {
                    if (gameinfo.font == "Wingdings"){
                        MenuBookButton()
                            .environmentObject(gameinfo)
                    }
                    else{
                        MenuButton()
                            .environmentObject(gameinfo)
                    }
                    Text("Game Stats")
                        .font(Font.custom(gameinfo.font, size: 34))
                        .frame(height: geo.size.height/13.5)
                        .foregroundColor(.white)
                        .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.white, style: StrokeStyle(lineWidth: 3, dash: [20, 5]))
                            )
                    Text("High Score: " + String(gameinfo.saobj.gameHighscore))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("Current number in a row: " + String(gameinfo.saobj.gameNumInRow))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)

                    Text("Most guesses in a row: " + String(gameinfo.saobj.gameMaxInRow))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("Total correct words: " + String(gameinfo.saobj.gameTotalNum))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("% of correct words: " + String(gameinfo.saobj.gameTotalPercent) + " %")
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("Number of times given up: " + String(gameinfo.saobj.gameNumGiveup))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("Number of hints used: " + String(gameinfo.saobj.gameNumHints))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Button("~ Overall Statistics ~"){
                        gameinfo.currPage = .stats
                    }
                    .font(Font.custom(gameinfo.font, size: 17))
                    .frame(height: geo.size.height/13.5)
                    .background(Color.white)
                    .cornerRadius(40)
                    .foregroundColor(Color(gameinfo.backgroundColor))
                }
                .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.white, lineWidth: 3)
                    )
            }
            .foregroundColor(.white)
    }
}
}

struct GameStats_Previews: PreviewProvider {
    static var previews: some View {
        GameStats()
            .environmentObject(GameInfo())
    }
}
