//
//  Highscore.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/29/22.
//

import SwiftUI

struct Stats: View {
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
                    Text("Overall Stats")
                        .font(Font.custom(gameinfo.font, size: 34))
                        .frame(height: geo.size.height/13.5)
                        .foregroundColor(.white)
                        .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.white, style: StrokeStyle(lineWidth: 3, dash: [20, 5]))
                            )
                    Text("High Score: " + String(gameinfo.saobj.highscore))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("Current number in a row: " + String(gameinfo.saobj.numInRow))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("Most guesses in a row: " + String(gameinfo.saobj.maxInRow))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("Total correct words: " + String(gameinfo.saobj.totalNum))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("% of correct words: " + String(gameinfo.saobj.totalPercent) + " %")
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("Number of times given up: " + String(gameinfo.saobj.numGiveup))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Text("Number of hints used: " + String(gameinfo.saobj.numHints))
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    Button("~ Game Statistics ~"){
                        gameinfo.currPage = .gameStats
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
        .onAppear{
            gameinfo.saobj.statsCount += 1
        }
}
}
struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
            .environmentObject(GameInfo())
    }
}
