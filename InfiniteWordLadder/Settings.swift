//
//  Settings.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/12/22.
//

import SwiftUI

class selectedState: ObservableObject {
    
    init(){
        
    }
    
    @Published var state: Int = 60
}







struct Settings: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @StateObject var sS = selectedState()
    
    
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
                Picker("Difficulty", selection: $sS.state){
                    Text("Beginner").tag(95)
                    Text("Intermediate").tag(63)
                    Text("Hard").tag(56)
                    Text("Challenging").tag(50)
                    Text("Expert").tag(41)
                }
                .pickerStyle(.segmented)
                .foregroundColor(.white)
                .onAppear{
                    sS.state = gameinfo.difficulty
                    print(sS.state)
                }
                Text("Gameinfo Level: \(gameinfo.difficulty) Difficulty Level \(sS.state)")
                Text("Settings go here")
        }
            .onChange(of: sS.state){
                newValue in
                gameinfo.defaults.set(sS.state, forKey: "Difficulty")
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
