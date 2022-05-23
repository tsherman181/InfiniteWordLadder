//
//  InfiniteWordLadderApp.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/11/22.
//

import SwiftUI

@main
struct InfiniteWordLadderApp: App {
    
    @StateObject var gameinfo = GameInfo()
    
    var body: some Scene {
        WindowGroup {
            MotherView()
                .environmentObject(gameinfo)
        }
    }
}
