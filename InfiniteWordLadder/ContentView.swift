//
//  ContentView.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/11/22.
//






import SwiftUI

struct ContentView: View {
    @State private var username: String = ""

//    var change: Bool = false {
//        didSet {
//            .backgroundColor = change ? .blue : .white
//        }
//    }
    
    var body: some View {
        VStack(spacing: 20){
//            var guessCorrect = guessing(guess: username)
//            var startPoints = 0
//            var points = pointCalc(correct: guessCorrect, prevPoints: startPoints)
            var state = Status()
            HStack{
                Spacer()
                Text(String(state.points))
                    .padding()
            }
            Text(String(state.guessCorrect))
            Text("Clue here!")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            TextField(
                "Guess",
                text: $username
            )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
                .shadow(color: .secondary, radius: 5, x: 5, y: 5) //change color later
            //Text(username)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
