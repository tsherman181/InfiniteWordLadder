//
//  Instructions.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/24/22.
//

import SwiftUI

struct Instructions: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    
    var body: some View {
        Text("Instructions Here")
        Button("back"){
            gameinfo.currPage = .p1
        }
    }
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
            .environmentObject(GameInfo())
    }
}
