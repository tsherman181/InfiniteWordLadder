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

    var body: some View {
        VStack(spacing: 335){
            Text("")
            VStack{
                Text("")
                HStack{
                    Spacer()
                    Text("Points:")
                        .foregroundColor(.primary)
                    Text(String(gameinfo.points))
                        .foregroundColor(.primary)
                        .padding(.trailing)
                }
                Text("Clue here!")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .foregroundColor(.green)
                TextField(
                    "Guess",
                    text: $username
                )
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                    .shadow(color: .green, radius: 5, x: 5, y: 5) //change color later
                    .onSubmit {
                //Text(username)
                        gameinfo.guessing(guess: username)
                        username = ""
                    }
                Text(username)
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
