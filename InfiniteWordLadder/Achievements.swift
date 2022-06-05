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
                    Spacer()
                }
                .padding()
                Group{
                HStack{
                    VStack{
                        Text("Score Over 10 Points")
                            .font(.caption)
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
                    }
                    VStack{
                        Text("Score Over 100 Points")
                            .font(.caption)
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
                    }
                    VStack{
                        Text("Score Over 500 Points")
                            .font(.caption)
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
                    }
                }
                HStack{
                    VStack{
                        Text("Score Over 1000 Points")
                            .font(.caption)
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
                    }
                    VStack{
                        Text("Get 5 Words In A Row")
                            .font(.caption)
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
                    }
                    VStack{
                        Text("Get 10 Words In A Row")
                            .font(.caption)
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
                    }
                }
                HStack{
                    VStack{
                        Text("Get 50 Words In A Row")
                            .font(.caption)
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
                    }
                    VStack{
                        Text("Wine and Dine")
                            .font(.caption)
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
                    }
                    VStack{
                        Text("Score Over 500 Points")
                            .font(.caption)
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
                    }
                }
                HStack{
                    Spacer()
                    VStack{
                        Text("Coin Flipper")
                            .font(.caption)
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
                    }
                    Spacer()
                    VStack{
                        Text("Statistics Addict")
                            .font(.caption)
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
                    }
                    Spacer()
                    VStack{
                        Text("Life is Good")
                            .font(.caption)
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
                    }
                    Spacer()
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
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
