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
        switch gameinfo.currPage {
        case .menu:
            Menu()
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .p1:
            IWL()
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .correct:
            Correct()
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .instructions:
            Instructions()
                .matchedGeometryEffect(id: "Shape", in: animation)
        case .giveup:
            GiveUp()
                .matchedGeometryEffect(id: "Shape", in: animation)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
            .environmentObject(GameInfo())
    }
}
