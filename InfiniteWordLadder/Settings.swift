//
//  Settings.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/12/22.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    
    @State private var difficultySetter = 50.0
    
    
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
                Slider(value: $difficultySetter, in: 0...100)
                    .onChange(of: difficultySetter){
                        newValue in
                        gameinfo.difficulty = Int(difficultySetter)
                        gameinfo.defaults.set(gameinfo.difficulty, forKey: "Difficulty")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.white)
                Text("Settings go here")
                Text(String(gameinfo.difficulty))
                Text(String(difficultySetter))
            }
            .onAppear{
                difficultySetter = Double(gameinfo.difficulty)
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
