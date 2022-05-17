//
//  ContentView.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/11/22.
//






import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @StateObject var gameinfo = GameInfo()
    @State private var clue = ""
    //@State private var clueCurrent: String = ""

    var body: some View {
        VStack(spacing: 335){
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
                    .padding(.bottom)
                    .onChange(of: clue) { newValue in
                        print ("changed")
                    }

                TextField(
                    "Guess",
                    text: $username
                )
                    .textInputAutocapitalization(.characters)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                    //.shadow(color: .white, radius: 5, x: 5, y: 5) //change color later
                    .onSubmit {
                //Text(username)
                        gameinfo.guessing(guess: username)
                        username = ""
                    }
                Text(username)
                Button("Hint") {
                    gameinfo.hint()
                    clue = gameinfo.currentClue
                    print(gameinfo.currentClue)
                }
                .background(.blue)
                .clipShape(Capsule())
                .font(.title2)
                .foregroundColor(.white)
            }
            Text("")
        }
        .background(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
