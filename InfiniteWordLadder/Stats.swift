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
                MenuButton()
                    .environmentObject(gameinfo)
                Text("Average number of guesses per word: ")
                    .font(Font.custom(gameinfo.font, size: 17))
                    .padding()
                Text("Average number of hints used per word: ")
                    .font(Font.custom(gameinfo.font, size: 17))
                    .padding()
                Text("High Score: " + String(gameinfo.saobj.highscore))
                    .font(Font.custom(gameinfo.font, size: 17))
                    .padding()
                Text("Current number in a row:" + String(gameinfo.saobj.numInRow))
                    .font(Font.custom(gameinfo.font, size: 17))
                    .padding()
                Text("Most guesses in a row: " + String(gameinfo.saobj.maxInRow))
                    .font(Font.custom(gameinfo.font, size: 17))
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
