//
//  Settings.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/12/22.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @State private var difficultyLevel = 50
    
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
                    Spacer()
                    }
                    .foregroundColor(.white)
                    .padding()
                }
                Picker("Difficulty", selection: $difficultyLevel){
                    Text("Beginner").tag(95)
                    Text("Intermediate").tag(63)
                    Text("Hard").tag(56)
                    Text("Challenging").tag(50)
                    Text("Expert").tag(41)
                }
                .pickerStyle(.segmented)
                .foregroundColor(.white)
            .onAppear{
                difficultyLevel = gameinfo.difficulty
            }
                Text("Gameinfo Level: \(gameinfo.difficulty) Difficulty Level \(difficultyLevel)")
            Text("Settings go here")
        }
            .onChange(of: difficultyLevel){
                newValue in
                gameinfo.defaults.set(difficultyLevel, forKey: "Difficulty")
                gameinfo.difficulty = gameinfo.defaults.integer(forKey: "Difficulty")
            }
        }
        .ignoresSafeArea()
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(GameInfo())
    }
}
