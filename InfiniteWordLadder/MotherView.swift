//
//  MotherView.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/23/22.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @Namespace private var animation
    var body: some View {
        VStack{
        switch gameinfo.currPage {
        case .menu:
            Menu()
                .environmentObject(gameinfo)
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .IWL:
            IWL()
                .environmentObject(gameinfo)
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .correct:
            Correct()
                .environmentObject(gameinfo)
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .instructions:
            Instructions()
                .environmentObject(gameinfo)
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .giveup:
            GiveUp()
                .environmentObject(gameinfo)
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .gameover:
            Gameover()
                .environmentObject(gameinfo)
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .achievements:
            Achievements()
                .environmentObject(gameinfo)
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .stats:
            Stats()
                .environmentObject(gameinfo)
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .gameStats:
            GameStats()
                .environmentObject(gameinfo)
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .settings:
            Settings()
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .credits:
            Credits()
                .matchedGeometryEffect(id: "Shape", in: animation)
        }
        }
        
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
            .environmentObject(GameInfo())
    }
}

