//
//  ContentView.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/11/22.
//






import SwiftUI

struct IWL: View {
    @EnvironmentObject var gameinfo: GameInfo
    @State private var username: String = ""
    @State private var clue = ""
    
    
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                Text("")
                VStack{
                    Text("")
                    HStack(){
                        Button{
                            gameinfo.currPage = .menu
                        }label:{
                            Label("", systemImage: "list.dash")
                                .font(.system(size: 20, weight: .bold, design: .default))
                        }
                        .foregroundColor(.white)
                        .padding()
                        Spacer()
                        Text("Points:")
                            .foregroundColor(.white)
                            .padding(.leading)
                        Text(String(gameinfo.points))
                            .foregroundColor(.white)
                            .padding(.trailing)
                    }
                    .padding()
                    Text(gameinfo.currentClue)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(height: 100)
                        .allowsTightening(true)
                        .multilineTextAlignment(.center)
                        .onChange(of: clue) { newValue in
                        }

                    TextField(
                        "Here",
                        text: $username
                    )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.system(size: 80))
                        .font(Font.body.bold())
                        .textInputAutocapitalization(.characters)
                        .disableAutocorrection(true)
                        .onChange(of: username){ newValue in
                            let i = Array(username)
                            var num = 0
                            var newUsername: [Character] = []
                            while (num < 4 && num < i.count){
                                newUsername.append(i[num])
                                num += 1
                            }
                            username = String(newUsername)
                        }//MARK: keeps username <= 4 characters
                        .onSubmit {
                            gameinfo.guessing(guess: username)
                            clue = gameinfo.currentClue
                            username = ""
                        }//MARK: clears usnername upon submission
                    HStack{
                        Text("Last word:")
                        Text(gameinfo.lastWord)
                    }
                    .foregroundColor(.white)
                    .padding()
                    Button("Hint") {
                        gameinfo.hint()
                        clue = gameinfo.currentClue
                        //print(gameinfo.currentClue)
                    }
                    .clipShape(Capsule())
                    .font(.title2)
                    .foregroundColor(.white)
                    Button("Give Up: -1 point") {
                        gameinfo.giveUp(gameinfo.currentWord, gameinfo.lastWord)
                        clue = gameinfo.currentClue
                    }
                    .padding(.vertical)
                    .clipShape(Capsule())
                    .font(.body)
                    .foregroundColor(.white)
                    HStack{
                        Spacer()
                        Button(){
                            gameinfo.currPage = .instructions
                        }
                        label: {
                            Image(systemName: "questionmark.circle.fill")
                        }
                        .font(.system(size: 30))
                        }
                        .padding(.vertical)
                        .clipShape(Capsule())
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                    }
                }
            }
            .ignoresSafeArea()
    }
}

struct IWL_Previews: PreviewProvider {
    static var previews: some View {
        IWL()
            .environmentObject(GameInfo())
            .previewInterfaceOrientation(.portraitUpsideDown)
            //.previewInterfaceOrientation(.landscapeLeft)
    }
}

