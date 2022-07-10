//
//  Settings.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 6/12/22.
//

import SwiftUI




struct Settings: View {
    @EnvironmentObject var gameinfo: GameInfo
    
    var body: some View {
        ZStack {
            Color(gameinfo.backgroundColor).ignoresSafeArea()
            VStack{
            MenuButton()
                .environmentObject(gameinfo)
            DifficultySlider()
                    .environmentObject(gameinfo)
            NumLetters()
                    .environmentObject(gameinfo)
            ColorPicker()
                    .environmentObject(gameinfo)
            FontPicker()
                    .environmentObject(gameinfo)
            MusicOnOff()
                    .environmentObject(gameinfo)
            LadderColor()
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

struct ColorPicker: View{
    @EnvironmentObject var gameinfo: GameInfo
    @State var color: Int = 0
    
    var body: some View{
        HStack{
            Spacer()
            Text("Number of letters: ")
                .font(.body)
            Picker("Number of Letters", selection: $color){
                Text("Blue").tag(0)
                Text("Red").tag(1)
                Text("Green").tag(2)
            }
            .pickerStyle(.segmented)
            .foregroundColor(.white)
            .onChange(of: color){ newValue in
                if (color == 0){
                    gameinfo.backgroundColor = UIColor.systemBlue
                }
                else if (color == 1){
                    gameinfo.backgroundColor = UIColor.systemRed
                }
                else if (color == 2){
                    gameinfo.backgroundColor = UIColor.systemGreen
                }
                gameinfo.defaults.set(color, forKey: "Background Color")
            }
            Spacer()
        }
        .onAppear{
            color = gameinfo.backgroundColorNumber
        }
    }
}




struct NumLetters: View{
    @EnvironmentObject var gameinfo: GameInfo
    @State var num = 0
    
    var body: some View{
        HStack{
            Spacer()
            Text("Number of letters: ")
                .font(.body)
            Picker("Number of Letters", selection: $num){
                Text("5").tag(5)
                Text("10").tag(10)
                Text("15").tag(15)
            }
            .pickerStyle(.segmented)
            .foregroundColor(.white)
            .onChange(of: num){ newValue in
                gameinfo.lettersShown = num
                gameinfo.defaults.set(gameinfo.lettersShown, forKey: "Letters Shown")
            }
            .onAppear{
                num = gameinfo.lettersShown
            }
            Spacer()
        }
    }
    
}



struct DifficultySlider: View{
    @EnvironmentObject var gameinfo: GameInfo
    @State var state = -100
    @State var state2 = 2.0
    @State var diffLevel = ""
    @State var diffColor = Color.blue
    
    var body: some View{
        VStack{
        HStack{
        Spacer()
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
            Spacer()
        }
        Text("Difficulty: ")
            .font(Font.custom(gameinfo.font, size: 17))
        Text(diffLevel)
            .foregroundColor(diffColor)
            .font(Font.custom(gameinfo.font, size: 17))
        }
    }
}



struct FontPicker: View{
    
    @EnvironmentObject var gameinfo: GameInfo
    @State private var fontname = "Comic Sans MS"
    
    var body: some View{
        VStack{
            Picker("Pick font", selection: $fontname){
                ForEach(["San Fransisco", "Arial", "Comic Sans MS", "Herculanum"], id: \.self){
                    Text($0).tag($0)
                }
            }
            .pickerStyle(.segmented)
            .font(Font.custom(gameinfo.font, size: 17))
            Picker("Pick font", selection: $fontname){
                ForEach(["San Fransisco", "Arial", "Comic Sans MS", "Herculanum"], id: \.self){
                    Text($0).tag($0)
                }
            }
            .pickerStyle(.segmented)
            .font(Font.custom(gameinfo.font, size: 17))
        Text(fontname)
            Text("What I look like")
            .font(Font.custom(fontname, size: 40))
            .onChange(of: fontname){ newValue in}
            
        }
        .onAppear{
            fontname = gameinfo.font
        }
        .onChange(of: fontname){ newValue in
            gameinfo.font = fontname
            gameinfo.defaults.set(fontname, forKey: "Font")
        }
    }
}

struct MusicOnOff: View{
    
    @EnvironmentObject var gameinfo: GameInfo
    @State private var onOff = true
    
    var body: some View{
        VStack{
            Toggle("Music Enabled", isOn: $onOff)
                .toggleStyle(SwitchToggleStyle(tint: .gray))
            }
            .onChange(of: onOff){ newValue in
                if (!onOff){
                    print("off")
                    gameinfo.music.pause()
                }
                else if (onOff){
                    print("on")
                    gameinfo.music.play()
                }
                gameinfo.defaults.set(onOff, forKey: "Music")
            }
            .onAppear{
                onOff = gameinfo.onOff
            }
    }
    
}


struct LadderColor: View{
    @EnvironmentObject var gameinfo: GameInfo
    @State var color: Int = 0
    
    var body: some View{
        HStack{
            Spacer()
            Text("Number of letters: ")
                .font(.body)
            Picker("Number of Letters", selection: $color){
                Text("White").tag(0)
                Text("Black").tag(1)
                Text("Gray").tag(2)
            }
            .pickerStyle(.segmented)
            .foregroundColor(.white)
            .onChange(of: color){ newValue in
                if (color == 0){
                    gameinfo.ladderColor = UIColor.white
                }
                else if (color == 1){
                    gameinfo.ladderColor = UIColor.black
                }
                else if (color == 2){
                    gameinfo.ladderColor = UIColor.systemGray
                }
                gameinfo.defaults.set(color, forKey: "Ladder Color")
            }
            Spacer()
        }
        .onAppear{
            color = gameinfo.ladderColorNumber
        }
    }
}



struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(GameInfo())
    }
}
