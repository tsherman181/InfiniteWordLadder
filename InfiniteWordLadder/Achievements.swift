//
//  Achievments.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/29/22.
//

import SwiftUI




struct Achievements: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    
    var body: some View {
        ZStack {
            Color.blue
            VStack {
                Text("Highest score: ")
                    .padding()
                Text("Most guesses in a row: ")
            }
        }
        .foregroundColor(.white)
        .ignoresSafeArea()
    }
}

struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements()
            .environmentObject(GameInfo())
    }
}
