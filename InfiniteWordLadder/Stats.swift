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
                Text("Average number of guesses per word: ")
                    .padding()
                Text("Average number of hints used per word: ")
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
