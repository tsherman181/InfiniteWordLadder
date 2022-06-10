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
            Color.blue
            VStack {
                HStack{
                    Button{
                        gameinfo.currPage = .menu
                    }label:{
                        Label("", systemImage: "list.dash")
                            .font(.system(size: 20, weight: .bold, design: .default))
                    Spacer()
                    }
                }
                .padding()
                Text("Average number of guesses per word: ")
                    .padding()
                Text("Average number of hints used per word: ")
                    .padding()
                Text("High Score: " + String(gameinfo.saobj.highscore))
                    .padding()
                Text("Current number in a row:" + String(gameinfo.saobj.numInRow))
                    .padding()
                Text("Most guesses in a row: " + String(gameinfo.saobj.maxInRow))
                    .padding()
            }
        }
        .ignoresSafeArea()
        .foregroundColor(.white)
    }
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
            .environmentObject(GameInfo())
    }
}
