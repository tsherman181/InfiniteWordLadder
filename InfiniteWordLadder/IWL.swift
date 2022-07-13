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
    
    var body: some View {
        ZStack{
            Color(gameinfo.backgroundColor).ignoresSafeArea()
            GeometryReader{ geo in
                if (gameinfo.lettersShown != 26){
                VStack{
                    MenuPoints()
                        .environmentObject(gameinfo)
                        .frame(height: geo.size.height/10)
                    Clue(clue: $clue)
                        .frame(height: geo.size.height/6)
                        .environmentObject(gameinfo)
                        //.frame(width: geo.size.width, height: geo.size.height)
                    TextFieldObject(username: $username)
                        .frame(height: geo.size.height/6)
                        .environmentObject(gameinfo)
                    MiddleInformation(clue: $clue)
                        .frame(height: geo.size.height/6)
                        .environmentObject(gameinfo)
                    
                    
                    if (gameinfo.lettersShown == 5){
                        Rectangle()
                            .foregroundColor(Color(gameinfo.backgroundColor))
                            .frame(height: geo.size.height/15)
                        FiveLine(start: 0, arr: gameinfo.fiveLetters, username: $username)
                            .frame(height: geo.size.height/8)
                            .environmentObject(gameinfo)
                    }
                    
                    else if (gameinfo.lettersShown == 10){
                        FiveLine(start: 0, arr: gameinfo.tenLetters, username: $username)
                            .frame(height: geo.size.height/8)
                            .environmentObject(gameinfo)
                        Rectangle()
                            .foregroundColor(Color(gameinfo.backgroundColor))
                            .frame(height: geo.size.height/50)
                        FiveLine(start: 5, arr: gameinfo.tenLetters, username: $username)
                            .frame(height: geo.size.height/8)
                            .environmentObject(gameinfo)
                    }
                    
                    else if (gameinfo.lettersShown == 15){
                        FiveLine(start: 0, arr: gameinfo.fifteenLetters, username: $username)
                            .frame(height: geo.size.height/12)
                            .environmentObject(gameinfo)
                        Rectangle()
                            .foregroundColor(Color(gameinfo.backgroundColor))
                            .frame(height: geo.size.height/100)
                        FiveLine(start: 5, arr: gameinfo.fifteenLetters, username: $username)
                            .frame(height: geo.size.height/12)
                            .environmentObject(gameinfo)
                        Rectangle()
                            .foregroundColor(Color(gameinfo.backgroundColor))
                            .frame(height: geo.size.height/100)
                        FiveLine(start: 10, arr: gameinfo.fifteenLetters, username: $username)
                            .frame(height: geo.size.height/12)
                            .environmentObject(gameinfo)
                    }

                }//VStack
                .onAppear{
                    clue = gameinfo.currentClue
                }
                }//if
                }//geo
            }//Z
                
        }//Var
}//struct


struct FiveLine: View{
    var start: Int
    var arr: String
    @Binding var username: String
    @EnvironmentObject var gameinfo: GameInfo
    var body: some View{
        GeometryReader{ geo in
            HStack(spacing: 0){
                ForEach(0..<5, id: \.self){i in
                Group{
                Spacer()
                    Button(String(Array(arr)[start+i])){
                        username.append(contentsOf: String(Array(arr)[start+i]))
                        print(String(Array(arr)[start+i]))
                    }
                    .frame(width: geo.size.width*0.15, height: geo.size.height)
                    .foregroundColor(Color(gameinfo.backgroundColor))
                    .background(.white)
                    .font(Font.custom(gameinfo.font, size: 28))
                    .cornerRadius(10)
                }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        }//MARK: do not know if this will work. Double check later
    }


struct MenuPoints: View{
    @EnvironmentObject var gameinfo: GameInfo
    var body: some View{
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
                .font(Font.custom(gameinfo.font, size: 17))
                .foregroundColor(.white)
                .padding(.leading)
            Text(String(gameinfo.points))
                .font(Font.custom(gameinfo.font, size: 17))
                .foregroundColor(.white)
                .padding(.trailing)
        }
        .padding(.bottom)
}
}


struct Clue: View{
    @Binding var clue: String
    @EnvironmentObject var gameinfo: GameInfo
    var body: some View{
        Text(gameinfo.currentClue)
            .foregroundColor(.white)
            .font(Font.custom(gameinfo.font, size: 34))
            .bold()
            .lineLimit(3)
            .multilineTextAlignment(.center)
            .allowsTightening(true)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .onChange(of: clue) { newValue in
                //print("onChangeCurrClue")
            }
    }
}


struct TextFieldObject: View{
    @EnvironmentObject var gameinfo: GameInfo
    @Binding var username: String
    
    var body: some View{
        
        VStack{
            Text(username)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(Font.custom(gameinfo.font, size: 60))
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
                }
                .onChange(of: username) { newValue in
                    if (username.count == 4){
                        gameinfo.guessing(guess: username)
                        username = ""
                    }
                }
                //MARK: keeps username <= 4 characters
        }
    }
}


struct TextFieldFocus: View{
    @FocusState private var focus: Bool
    @State private var username = ""
    @EnvironmentObject var gameinfo: GameInfo
    var body: some View{
        
        VStack{
            TextField(
                "",
                text: $username
            )
                .focused($focus)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(Font.custom(gameinfo.font, size: 60))
                //.font(.system(size: 60))
                //.font(Font.body.bold())
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
                }
                .onChange(of: username) { newValue in
                    if (username.count == 4){
                        gameinfo.guessing(guess: username)
                        username = ""
                    }
                }
                //.navigationBarHidden(true)
                //MARK: keeps username <= 4 characters
        }
        .onAppear{
            focus = true
        }
    }
}





struct MiddleInformation: View{
    @EnvironmentObject var gameinfo: GameInfo
    @Binding var clue: String
    var body: some View{
        VStack{
        HStack{
            Text("Last word:")
                .font(Font.custom(gameinfo.font, size: 17))
            Text(gameinfo.lastWord)
                .font(Font.custom(gameinfo.font, size: 17))
            Button{
                gameinfo.currPage = .instructions
            }label:{
                Label("", systemImage: "questionmark.circle")
                    .font(.system(size: 20, weight: .bold, design: .default))
            }
            .foregroundColor(.white)
        }
        .foregroundColor(.white)
        HStack{
        Spacer()
        Button("Hint") {
            gameinfo.hint()
            clue = gameinfo.currentClue
            print("hint")
        }
        .clipShape(Rectangle())
        .font(Font.custom(gameinfo.font, size: 22))
        .foregroundColor(.white)
        Spacer()
        Button("Give Up: -1 point") {
            gameinfo.giveUp(gameinfo.currentWord, gameinfo.lastWord)
            print("giveup")
        }
        .clipShape(Rectangle())
        .font(Font.custom(gameinfo.font, size: 22))
        .foregroundColor(.white)
        Spacer()
        }
        .padding(.vertical)
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

