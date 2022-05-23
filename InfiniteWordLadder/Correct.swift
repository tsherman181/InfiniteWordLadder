//
//  Correct.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/23/22.
//

import SwiftUI

struct Correct: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    
    
    
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                Text("Correct! Good job!")
                    .foregroundColor(.white)
                    .font(.largeTitle)
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