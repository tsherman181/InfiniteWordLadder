//
//  Correct.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/23/22.
//

import SwiftUI

struct Correct: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @State var animationAmount = 1
    
    
    var body: some View {
        ZStack{
            Color(gameinfo.backgroundColor)
            VStack{
                Text("Correct! Good job!")
                    .foregroundColor(.white)
                    .font(Font.custom(gameinfo.font, size: 34))
            }
        }
        .ignoresSafeArea()
    }
}

struct Correct_Previews: PreviewProvider {
    static var previews: some View {
        Correct()
            .environmentObject(GameInfo())
    }
}
