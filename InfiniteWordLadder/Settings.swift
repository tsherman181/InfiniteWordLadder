//
//  Settings.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/12/22.
//

import SwiftUI




struct Settings: View {
    @State var state = -100
    @EnvironmentObject var gameinfo: GameInfo
    
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
                Picker("Difficulty", selection: $state){
                    Text("Beginner").tag(95)
                        .font(.system(size: 6))
                    Text("Intermediate").tag(63)
                        .font(.system(size: 6))
                    Text("Hard").tag(56)
                        .font(.system(size: 6))
                    Text("Challenging").tag(50)
                        .font(.system(size: 6))
                    Text("Expert").tag(41)
                        .font(.system(size: 6))
                }
                .pickerStyle(.segmented)
                .foregroundColor(.white)
                .onAppear{
                    state = gameinfo.difficulty
                    print(state)
                }
                .onChange(of: state){
                    newValue in
                    gameinfo.changeDiff(state)
                    print(state)
                    print(gameinfo.difficulty)
                }
                Text("Gameinfo Level: \(self.gameinfo.difficulty) Difficulty Level \(state)")
                    .onChange(of: gameinfo.difficulty){newValue in}
                Text("Settings go here")
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
