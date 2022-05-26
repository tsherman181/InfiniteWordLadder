//
//  MotherView.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/23/22.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    
    var body: some View {
        switch gameinfo.currPage {
        case .p1:
            ContentView()
        case .p2:
            Correct()
        case .p3:
            Instructions()
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
            .environmentObject(GameInfo())
    }
}
