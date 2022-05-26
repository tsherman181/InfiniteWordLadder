//
//  ContentView.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/11/22.
//






import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameinfo: GameInfo
    @State private var username: String = ""
    @State private var clue = ""
    //@State private var clueCurrent: String = ""

    var body: some View {
        ZStack{
            Color.blue
            VStack(){
                Text("")
                VStack{
                    Text("")
                    HStack{
                        Spacer()
                        Text("Points:")
                            .foregroundColor(.white)
                        Text(String(gameinfo.points))
                            .foregroundColor(.white)
                            .padding(.trailing)
                    }
                    Text(gameinfo.currentClue)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(height: 100)
                        .allowsTightening(true)
                        .onChange(of: clue) { newValue in
                            //print ("changed")
                        }

                    TextField(
                        "FOUR",
                        text: $username
                    )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.system(size: 80))
                        .font(Font.body.bold())
                        .textInputAutocapitalization(.characters)
                        .disableAutocorrection(true)
                        .padding(.horizontal)
                        //.shadow(color: .white, radius: 5, x: 5, y: 5) //change color later
                        .onSubmit {
                    //Text(username)
                            gameinfo.guessing(guess: username)
                            clue = gameinfo.currentClue
                            username = ""
                        }
                    Text(username)
                    Button("Hint") {
                        gameinfo.hint()
                        clue = gameinfo.currentClue
                        print(gameinfo.currentClue)
                    }
                    .clipShape(Capsule())
                    .font(.title2)
                    .foregroundColor(.white)
                    Button("Give Up: -1 point") {
                        gameinfo.change(gameinfo.currentWord)
                        gameinfo.points -= 1
                        clue = gameinfo.currentClue
                        print(gameinfo.currentClue)
                    }
                    .padding(.vertical)
                    .clipShape(Capsule())
                    .font(.body)
                    .foregroundColor(.white)
                    HStack{
                        Spacer()
                        Button(){
                            print("button")
                            gameinfo.currPage = .p3
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
                Text("")
            }
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GameInfo())
    }
}
