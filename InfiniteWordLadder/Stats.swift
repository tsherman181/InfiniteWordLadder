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
            VStack{
                if (gameinfo.font == "Wingdings"){
                    MenuBookButton()
                        .environmentObject(gameinfo)
                }
                else{
                    MenuButton()
                        .environmentObject(gameinfo)
                }
                Text("Statistics")
                    .font(Font.custom(gameinfo.font, size: 34))
                    .foregroundColor(.white)
                Text("High Score: " + String(gameinfo.saobj.highscore))
                    .font(Font.custom(gameinfo.font, size: 20))
                    .padding()
                Text("Current number in a row:" + String(gameinfo.saobj.numInRow))
                    .font(Font.custom(gameinfo.font, size: 20))
                    .padding()
                Text("Most guesses in a row: " + String(gameinfo.saobj.maxInRow))
                    .font(Font.custom(gameinfo.font, size: 20))
                    .padding()
                Text("Total number correct words: " + String(gameinfo.saobj.totalNum))
                    .font(Font.custom(gameinfo.font, size: 20))
                    .padding()
                Text("Percentage of correct words: " + String(gameinfo.saobj.totalPercent) + " %")
                    .font(Font.custom(gameinfo.font, size: 20))
                    .padding()
                Text("Number of times given up: " + String(gameinfo.saobj.numGiveup))
                    .font(Font.custom(gameinfo.font, size: 20))
                    .padding()
                Spacer()
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
