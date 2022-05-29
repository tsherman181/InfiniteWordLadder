//
//  GiveUp.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/28/22.
//

import SwiftUI

struct GiveUp: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    
    
    
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                VStack{
                    Text("Oops, the correct answer was:")
                        .padding()
                    Text(gameinfo.currentWord)
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
        .ignoresSafeArea()
    }
}

struct GiveUp_Previews: PreviewProvider {
    static var previews: some View {
        GiveUp()
            .environmentObject(GameInfo())
    }
}