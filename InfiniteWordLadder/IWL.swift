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
    @FocusState private var focus: Bool
    
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
                VStack{
                    HStack{
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
                    Text(gameinfo.currentClue)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        //.frame(height: 100)
                        .allowsTightening(true)
                        .multilineTextAlignment(.center)
                        .onChange(of: clue) { newValue in
                        }

                    TextField(
                        "Here",
                        text: $username
                    )
                    .onAppear{
                        focus = true
                    }
                        .focused($focus)
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
                        .onChange(of: username) { newValue in
                            if (username.count == 4){
                                gameinfo.guessing(guess: username)
                                clue = gameinfo.currentClue
                                username = ""
                            }
                        }//MARK: clears usnername upon submission
                    HStack{
                        Text("Last word:")
                        Text(gameinfo.lastWord)
                    }
                    .foregroundColor(.white)
                    HStack{
                    Spacer()
                    Button("Hint") {
                        gameinfo.hint()
                        clue = gameinfo.currentClue
                        //print(gameinfo.currentClue)
                    }
                    .clipShape(Capsule())
                    .font(.title2)
                    .foregroundColor(.white)
                    Spacer()
                    Button("Give Up: -1 point") {
                        gameinfo.giveUp(gameinfo.currentWord, gameinfo.lastWord)
                        clue = gameinfo.currentClue
                    }
                    .clipShape(Capsule())
                    .font(.body)
                    .foregroundColor(.white)
                    Spacer()
                    }
                    .padding(.vertical)
                    if (gameinfo.lettersShown == 5){
                        HStack{
                            Group{
                            Spacer()
                            Button(String(Array(gameinfo.fiveLetters)[0])){
                                username.append(contentsOf: String(Array(gameinfo.fiveLetters)[0]))
                            }
                                .padding()
                                .foregroundColor(.blue)
                                .background(.white)
                                .font(.callout)
                                .cornerRadius(10)
                            Spacer()
                            Button(String(Array(gameinfo.fiveLetters)[1])){
                                username.append(contentsOf: String(Array(gameinfo.fiveLetters)[1]))
                            }
                                .padding()
                                .foregroundColor(.blue)
                                .background(.white)
                                .font(.callout)
                                .cornerRadius(10)
                            Spacer()
                            Button(String(Array(gameinfo.fiveLetters)[2])){
                                username.append(contentsOf: String(Array(gameinfo.fiveLetters)[2]))
                            }
                                .padding()
                                .foregroundColor(.blue)
                                .background(.white)
                                .font(.callout)
                                .cornerRadius(10)
                            Spacer()
                            Button(String(Array(gameinfo.fiveLetters)[3])){
                                username.append(contentsOf: String(Array(gameinfo.fiveLetters)[3]))
                            }
                                .padding()
                                .foregroundColor(.blue)
                                .background(.white)
                                .font(.callout)
                                .cornerRadius(10)
                            Spacer()
                            Button(String(Array(gameinfo.fiveLetters)[4])){
                                username.append(contentsOf: String(Array(gameinfo.fiveLetters)[4]))
                            }
                                .padding()
                                .foregroundColor(.blue)
                                .background(.white)
                                .font(.callout)
                                .cornerRadius(10)
                            }
                            Spacer()
                        }
                    }
                    //Text(gameinfo.fiveLetters + " " + gameinfo.tenLetters + " " + gameinfo.fifteenLetters) //MARK: For testing purposes
                    
                    else if (gameinfo.lettersShown == 10){
                        VStack{
                            HStack{
                                Group{
                                Spacer()
                                Button(String(Array(gameinfo.tenLetters)[0])){
                                    username.append(contentsOf: String(Array(gameinfo.tenLetters)[0]))
                                }
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.callout)
                                    .cornerRadius(10)
                                Spacer()
                                Button(String(Array(gameinfo.tenLetters)[1])){
                                    username.append(contentsOf: String(Array(gameinfo.tenLetters)[1]))
                                }
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.callout)
                                    .cornerRadius(10)
                                Spacer()
                                Button(String(Array(gameinfo.tenLetters)[2])){
                                    username.append(contentsOf: String(Array(gameinfo.tenLetters)[2]))
                                }
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.callout)
                                    .cornerRadius(10)
                                Spacer()
                                Button(String(Array(gameinfo.tenLetters)[3])){
                                    username.append(contentsOf: String(Array(gameinfo.tenLetters)[3]))
                                }
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.callout)
                                    .cornerRadius(10)
                                Spacer()
                                Button(String(Array(gameinfo.tenLetters)[4])){
                                    username.append(contentsOf: String(Array(gameinfo.tenLetters)[4]))
                                }
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.callout)
                                    .cornerRadius(10)
                                }
                                Spacer()
                            }
                            .padding()
                            HStack{
                                Group{
                                Spacer()
                                Button(String(Array(gameinfo.tenLetters)[5])){
                                    username.append(contentsOf: String(Array(gameinfo.tenLetters)[5]))
                                }
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.callout)
                                    .cornerRadius(10)
                                Spacer()
                                Button(String(Array(gameinfo.tenLetters)[6])){
                                    username.append(contentsOf: String(Array(gameinfo.tenLetters)[6]))
                                }
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.callout)
                                    .cornerRadius(10)
                                Spacer()
                                Button(String(Array(gameinfo.tenLetters)[7])){
                                    username.append(contentsOf: String(Array(gameinfo.tenLetters)[7]))
                                }
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.callout)
                                    .cornerRadius(10)
                                Spacer()
                                Button(String(Array(gameinfo.tenLetters)[8])){
                                    username.append(contentsOf: String(Array(gameinfo.tenLetters)[8]))
                                }
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.callout)
                                    .cornerRadius(10)
                                Spacer()
                                Button(String(Array(gameinfo.tenLetters)[9])){
                                    username.append(contentsOf: String(Array(gameinfo.tenLetters)[9]))
                                }
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.callout)
                                    .cornerRadius(10)
                                    f
                                }
                                Spacer()
                            }
                        }
                    }
                    Spacer()
                    }
                    .navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.bottom)
            }
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

