//
//  Settings.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/12/22.
//

import SwiftUI




struct Settings: View {
    @State var state = -100
    @State var state2 = 2.0
    @State var diffLevel = ""
    @State var diffColor = Color.blue
    @EnvironmentObject var gameinfo: GameInfo
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack{
            MenuButton()
                .environmentObject(gameinfo)
            /*
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
             */
                HStack{
                    Spacer()
                    Text("Difficulty")
                        .font(.largeTitle)
                    Spacer()
                }
                Slider(value: $state2, in: 1.0...5.0)
                    .onAppear{
                        state = gameinfo.difficulty
                        print(state)
                        if (state == 95){
                            state2 = 1
                            diffLevel = "Basic"
                            diffColor = Color.green
                        }
                        else if (state == 63){
                            state2 = 2
                            diffLevel = "Beginner"
                            diffColor = Color.yellow
                        }
                        else if (state == 56){
                            state2 = 3
                            diffLevel = "Intermediate"
                            diffColor = Color.orange
                        }
                        else if (state == 50){
                            state2 = 4
                            diffLevel = "Hard"
                            diffColor = Color.red
                        }
                        else{
                            state2 = 5
                            diffLevel = "Expert"
                            diffColor = Color.black
                        }
                    }
                    .onChange(of: state2){
                        newValue in
                        if (round(state2) == 1){
                            state = 95
                            diffLevel = "Basic"
                            diffColor = Color.green
                        }
                        else if (round(state2) == 2){
                            state = 63
                            diffLevel = "Beginner"
                            diffColor = Color.yellow
                        }
                        else if (round(state2) == 3){
                            state = 56
                            diffLevel = "Intermediate"
                            diffColor = Color.orange
                        }
                        else if (round(state2) == 4){
                            state = 50
                            diffLevel = "Hard"
                            diffColor = Color.red
                        }
                        else{
                            state = 41
                            diffLevel = "Expert"
                            diffColor = Color.black
                        }
                        gameinfo.changeDiff(state)
                        print(state)
                        print(gameinfo.difficulty)
                    }
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .padding(.horizontal)
                Text(diffLevel)
                    .foregroundColor(diffColor)
                    .font(.largeTitle)
                /*
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
                 */
        }
        }
        }
    }

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(GameInfo())
    }
}
