//
//  Achievments.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/29/22.
//

import SwiftUI




struct Achievements: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @State private var animationAmount = 0.0
    @State private var rX = 0.0
    @State private var rY = 0.0
    
    var body: some View {
        ZStack {
            Color.blue
            VStack {
                HStack{
                    Button{
                        gameinfo.currPage = .menu
                    }label:{
                        Label("", systemImage: "list.dash")
                            .font(.system(size: 20, weight: .bold, design: .default))
                    }
                    Spacer()
                }
                .padding()
                VStack{
                    Text("Score Over 10 Points")
                Button(action: {
                    rX = Double(Float.random(in: 0..<1))
                    rY = Double(Float.random(in: 0..<1))
                    withAnimation{animationAmount+=360}
                    
                }){
                    Image(systemName: "star.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow, .orange)
                        //.opacity(50)
                        .font(.largeTitle.weight(.bold))
                        .imageScale(.large)
                        .foregroundStyle(
                                .ultraThickMaterial,
                                .ultraThinMaterial
                            )
                        .rotation3DEffect(.degrees(animationAmount), axis: (x:rX, y:rY, z:abs(rX-rY)))
                    }
                }
                    Text("Highest score: ")
                        .padding()
                    Text("Most guesses in a row: ")
            }
        }
        .foregroundColor(.white)
        .ignoresSafeArea()
    }
}

struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements()
            .environmentObject(GameInfo())
    }
}
