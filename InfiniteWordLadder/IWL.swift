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
            Color.blue
                .ignoresSafeArea()
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
                            .foregroundColor(.blue)
                            .frame(height: geo.size.height/15)
                        FiveLine(start: 0, arr: gameinfo.tenLetters, username: $username)
                            .frame(height: geo.size.height/8)
                            .environmentObject(gameinfo)
                    }
                    
                    else if (gameinfo.lettersShown == 10){
                        FiveLine(start: 0, arr: gameinfo.tenLetters, username: $username)
                            .frame(height: geo.size.height/8)
                            .environmentObject(gameinfo)
                        Rectangle()
                            .foregroundColor(.blue)
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
                            .foregroundColor(.blue)
                            .frame(height: geo.size.height/100)
                        FiveLine(start: 5, arr: gameinfo.fifteenLetters, username: $username)
                            .frame(height: geo.size.height/12)
                            .environmentObject(gameinfo)
                        Rectangle()
                            .foregroundColor(.blue)
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
                    .foregroundColor(.blue)
                    .background(.white)
                    .font(.callout)
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
                .foregroundColor(.white)
                .padding(.leading)
            Text(String(gameinfo.points))
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
            .font(.largeTitle)
            .bold()
            .lineLimit(3)
            .multilineTextAlignment(.center)
            .allowsTightening(true)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .onChange(of: clue) { newValue in
                print("onChangeCurrClue")
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
                .font(.system(size: 60))
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
                .font(.system(size: 60))
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
            Text("LAST")
        }
        .foregroundColor(.white)
        HStack{
        Spacer()
        Button("Hint") {
            gameinfo.hint()
            clue = gameinfo.currentClue
            print("hint")
        }
        .clipShape(Capsule())
        .font(.title2)
        .foregroundColor(.white)
        Spacer()
        Button("Give Up: -1 point") {
            gameinfo.giveUp(gameinfo.currentWord, gameinfo.lastWord)
            print("giveup")
        }
        .clipShape(Capsule())
        .font(.title2)
        .foregroundColor(.white)
        Spacer()
        }
        .padding(.vertical)
    }
}
}

    /*
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
*/
struct IWL_Previews: PreviewProvider {
    static var previews: some View {
        IWL()
            .environmentObject(GameInfo())
            .previewInterfaceOrientation(.portraitUpsideDown)
            //.previewInterfaceOrientation(.landscapeLeft)
    }
}

