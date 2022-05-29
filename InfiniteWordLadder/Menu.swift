//
//  Menu.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/28/22.
//

import SwiftUI

struct Menu: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                Button("Infinite Word Ladder"){
                    gameinfo.currPage = .p1
                }
                .background(.white)
                .foregroundColor(.blue)
                .clipShape(Rectangle())
                .dynamicTypeSize(.large)
                Button("Instructions"){
                    gameinfo.currPage = .instructions
                }
                .background(.white)
                .foregroundColor(.blue)
                .clipShape(Rectangle())
                .dynamicTypeSize(.large)
            }
        }
        .ignoresSafeArea()
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
            .environmentObject(GameInfo())
    }
}
