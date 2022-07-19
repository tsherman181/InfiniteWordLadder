//
//  Credits.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 7/18/22.
//

import SwiftUI

struct Credits: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    
    var body: some View {
        ZStack{
            Color(gameinfo.backgroundColor).ignoresSafeArea()
            VStack{
                MenuButton()
                Text("Thanks for playing our game!")

            }
        }
    }
}

struct Credits_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
    }
}
