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
        ZStack{
            Color.blue
            VStack{
                Text("Instructions Here")
                Button("back"){
                    gameinfo.currPage = .IWL
                }
            }
            .foregroundColor(.white)
            .font(.system(size: 50, weight: .bold, design: .rounded))
        }
        .ignoresSafeArea()
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
            .environmentObject(GameInfo())
    }
}
}
