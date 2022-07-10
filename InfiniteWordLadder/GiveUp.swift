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
            Color(gameinfo.backgroundColor)
            VStack{
                VStack{
                    Text("Oops, the correct answer was:")
                        
                        .padding()
                    Text(gameinfo.currentWord)
                }
                .foregroundColor(.white)
                .font(Font.custom(gameinfo.font, size: 34))
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
