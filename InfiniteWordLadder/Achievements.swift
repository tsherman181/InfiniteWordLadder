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
    
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    
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
                    .foregroundColor(.white)
                    .padding()
                    Spacer()
                }
                .padding(.bottom)
                HStack{
                    Spacer()
                    Text("Score 10 Points")
                        .padding(.leading)
                    Spacer()
                    Text("Score 50 Points")
                    Spacer()
                    Text("Score 100 Points")
                        .padding(.trailing)
                    Spacer()
                }
                .foregroundColor(.white)
                .font(.caption)
                HStack{
                Spacer()
                Button(action: {
                    if (min(Double(gameinfo.achievements[0])+0.5, 1.0) == 1){
                        rX = Double(Float.random(in: 0..<1))
                        rY = Double(Float.random(in: 0..<1))
                        withAnimation{animationAmount+=360}
                    }
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
                        .rotation3DEffect(.degrees(animationAmount), axis: (x:rX, y:rY, z:0))
                        .opacity(min(Double(gameinfo.achievements[0])+0.5, 1.0))
                    }
                Spacer()
                Button(action: {
                    if (min(Double(gameinfo.achievements[0])+0.5, 1.0) == 1){
                        rX = Double(Float.random(in: 0..<1))
                        rY = Double(Float.random(in: 0..<1))
                        withAnimation{animationAmount+=360}
                    }
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
                        .rotation3DEffect(.degrees(animationAmount), axis: (x:rX, y:rY, z:0))
                        .opacity(min(Double(gameinfo.achievements[0])+0.5, 1.0))
                    }
                Spacer()
                Button(action: {
                    if (min(Double(gameinfo.achievements[0])+0.5, 1.0) == 1){
                        rX = Double(Float.random(in: 0..<1))
                        rY = Double(Float.random(in: 0..<1))
                        withAnimation{animationAmount+=360}
                    }
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
                        .rotation3DEffect(.degrees(animationAmount), axis: (x:rX, y:rY, z:0))
                        .opacity(min(Double(gameinfo.achievements[0])+0.5, 1.0))
                    }
                Spacer()
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements()
            .environmentObject(GameInfo())
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
