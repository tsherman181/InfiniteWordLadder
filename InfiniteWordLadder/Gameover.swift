//
//  Gameover.swift
//  InfiniteWordLadder
//
//  Created by Erika Webb on 7/1/22.
//

import SwiftUI

struct Gameover: View {

    @EnvironmentObject var gameinfo: GameInfo
    @State var animationAmount = 1


    var body: some View {
        ZStack{
            Color(gameinfo.backgroundColor)
            VStack{
                Text("Gameover!")
                    .foregroundColor(.white)
                    .font(Font.custom(gameinfo.font, size: 34))
            }
        }
        .ignoresSafeArea()
    }
}

struct Gameover_Previews: PreviewProvider {
    static var previews: some View {
        Gameover()
            .environmentObject(GameInfo())
    }
}
