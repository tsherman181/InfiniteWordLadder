//
//  Highscore.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/29/22.
//

import SwiftUI

struct Stats: View {
    @EnvironmentObject var gameinfo: GameInfo
    var body: some View {
        ZStack {
            Color(gameinfo.backgroundColor).ignoresSafeArea()
            GeometryReader { geo in
                VStack {
                    if (gameinfo.font == "Wingdings"){
                        MenuBookButton()
                            .environmentObject(gameinfo)
                    }
                    else{
                        MenuButton()
                            .environmentObject(gameinfo)
                    }
                    HStack {
                        Image(systemName: "bolt.fill")
                        Text("Overall Stats")
                        Image(systemName: "bolt.fill")
                    }
                        .font(Font.custom(gameinfo.font, size: 34))
                        .frame(height: geo.size.height/13.5)
                        .foregroundColor(.white)
                        .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.white, style: StrokeStyle(lineWidth: 3, dash: [20, 5]))
                            )
                    HStack {
                        Image(systemName: "hands.sparkles")
                        Text("High Score: " + String(gameinfo.saobj.highscore))
                    }
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    HStack {
                        Image(systemName: "paperclip.circle.fill")
                        Text("Current number in a row: " + String(gameinfo.saobj.numInRow))
                    }
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    HStack {
                        Image(systemName: "brain.head.profile")
                        Text("Most guesses in a row: " + String(gameinfo.saobj.maxInRow))
                    }
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    HStack {
                        Image(systemName: "star.bubble.fill")
                        Text("Total correct words: " + String(gameinfo.saobj.totalNum))
                    }
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    HStack {
                        Image(systemName: "flame")
                        Text("% of correct words: " + String(gameinfo.saobj.totalPercent) + " %")
                    }
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    HStack {
                        Image(systemName: "bolt.heart.fill")
                        Text("Give up count: " + String(gameinfo.saobj.numGiveup))
                    }
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    HStack {
                        Image(systemName: "eyes")
                        Text("Hint count: " + String(gameinfo.saobj.numHints))
                    }
                        .font(Font.custom(gameinfo.font, size: 20))
                        .frame(height: geo.size.height/13.5)
                    HStack {
                        Image(systemName: "sparkles")
                        Button("Game Statistics"){
                            gameinfo.currPage = .gameStats
                        }
                        Image(systemName: "sparkles")
                    }
                    .font(Font.custom(gameinfo.font, size: 17))
                    .frame(width: geo.size.width/1.5, height: geo.size.height/13.5)
                    .background(Color.white)
                    .cornerRadius(40)
                    .foregroundColor(Color(gameinfo.backgroundColor))
                    
                }
            }
            .foregroundColor(.white)
    }
        .onAppear{
            gameinfo.saobj.statsCount += 1
        }
}
}
struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
            .environmentObject(GameInfo())
    }
}
