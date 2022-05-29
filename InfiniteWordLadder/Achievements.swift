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
        Text("Cool Achievements Screen will go here")
    }
}

struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements()
            .environmentObject(GameInfo())
    }
}
