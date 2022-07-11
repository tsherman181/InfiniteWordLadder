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
            GeometryReader{ geo in
            VStack(spacing:0){
            MenuButton()
                .environmentObject(gameinfo)
                .frame(height: geo.size.height/15)
            Text("Difficulty")
                .frame(height: geo.size.height/10)
                .font(Font.custom(gameinfo.font, size: 34))
            DifficultySlider()
                    .environmentObject(gameinfo)
                    .frame(height: geo.size.height/15)
            NumLetters()
                    .environmentObject(gameinfo)
                    .frame(height: geo.size.height/15)
            Text("Aesthetics")
                .frame(height: geo.size.height/10)
                .font(Font.custom(gameinfo.font, size: 34))
            ColorPicker()
                    .environmentObject(gameinfo)
                    .frame(height: geo.size.height/15)
            LadderColor()
                    .environmentObject(gameinfo)
                    .frame(height: geo.size.height/10)
            FontPicker()
                    .environmentObject(gameinfo)
                    .frame(height: geo.size.height/7)
            MusicOnOff()
                    .environmentObject(gameinfo)
                    .frame(height: geo.size.height/10)
        }
        }
        }
        }
    }

struct ColorPicker: View{
    @EnvironmentObject var gameinfo: GameInfo
    @State var color: Int = 0
    
    var body: some View{
        GeometryReader{ geo in
        HStack(spacing:0){
            Text("Background Color: ")
                .font(Font.custom(gameinfo.font, size: 17))
                .frame(width: geo.size.width/2, alignment: .leading)
            Picker("Number of Letters", selection: $color){
                Text("Blue").tag(0)
                Text("Red").tag(1)
                Text("Green").tag(2)
            }
            .frame(width: geo.size.width/2)
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
        }
        .onAppear{
            gameinfo.backgroundColorNumber = gameinfo.defaults.integer(forKey: "Background Color")
            color = gameinfo.backgroundColorNumber
        }
        }
        .padding()
    }
}




struct NumLetters: View{
    @EnvironmentObject var gameinfo: GameInfo
    @State var num = 0
    
    var body: some View{
        GeometryReader{geo in
        HStack(spacing: 0){
            Text("Number of letters: ")
                .font(Font.custom(gameinfo.font, size: 17))
                .frame(width: geo.size.width/2, alignment: .leading)
            Picker("Number of Letters", selection: $num){
                Text("5").tag(5)
                Text("10").tag(10)
                Text("15").tag(15)
            }
            .pickerStyle(.segmented)
            .frame(width: geo.size.width/2)
            .foregroundColor(.white)
            .onChange(of: num){ newValue in
                gameinfo.lettersShown = num
                gameinfo.defaults.set(gameinfo.lettersShown, forKey: "Letters Shown")
            }
            .onAppear{
                num = gameinfo.lettersShown
            }
        }
        }
        .padding()
    }
    
}



struct DifficultySlider: View{
    @EnvironmentObject var gameinfo: GameInfo
    @State var state = -100
    @State var state2 = 2.0
    @State var diffLevel = ""
    @State var diffColor = Color.blue
    
    var body: some View{
        GeometryReader{geo in
        HStack(spacing:0){
            HStack(spacing:0){
                Text("Words: ")
                    .font(Font.custom(gameinfo.font, size: 17))
                + Text(diffLevel)
                    .font(Font.custom(gameinfo.font, size: 17))
                    .foregroundColor(diffColor)
            }
            .frame(width: geo.size.width*0.55, height: geo.size.height, alignment: .leading)
        Slider(value: $state2, in: 1.0...5.0)
            .frame(width: geo.size.width*0.45, height: geo.size.height)
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
        }
    }
    .padding()
    }
}



struct FontPicker: View{
    
    @EnvironmentObject var gameinfo: GameInfo
    @State private var fontname = "Comic Sans MS"
    
    var body: some View{
        GeometryReader{ geo in
        HStack(spacing:0){
            Text("Fonts:")
                .font(Font.custom(gameinfo.font, size: 17))
                .frame(width: geo.size.width*0.20, height: geo.size.height, alignment: .leading)
        VStack(spacing:0){
            Picker("Pick font", selection: $fontname){
                ForEach(["San Fransisco", "Arial", "Comic Sans MS", "Herculanum"], id: \.self){
                    Text($0).tag($0)
                }
            }
            .frame(width: geo.size.width*0.80, height: geo.size.height/2)
            .pickerStyle(.segmented)
            .font(Font.custom(gameinfo.font, size: 17))
            Picker("Pick font", selection: $fontname){
                ForEach(["San Fransisco", "Arial", "Comic Sans MS", "Herculanum"], id: \.self){
                    Text($0).tag($0)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: geo.size.width*0.80, height: geo.size.height/2)
            .font(Font.custom(gameinfo.font, size: 17))
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
    .padding()
    }
}

struct MusicOnOff: View{
    
    @EnvironmentObject var gameinfo: GameInfo
    @State private var onOff = true
    
    var body: some View{
        GeometryReader{geo in
        HStack(spacing:0){
            Text("Music Enabled")
                .frame(width: geo.size.width/2, alignment: .leading)
                .font(Font.custom(gameinfo.font, size: 17))
            Toggle("", isOn: $onOff)
                .toggleStyle(SwitchToggleStyle(tint: .gray))
                .frame(width: geo.size.width*0.5, alignment: .leading)
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
        .padding()
    }
    
}


struct LadderColor: View{
    @EnvironmentObject var gameinfo: GameInfo
    @State var color: Int = 0
    
    var body: some View{
        GeometryReader{geo in
            HStack(spacing:0){
            Text("Ladder Color: ")
                .frame(width: geo.size.width/2, alignment: .leading)
                .font(Font.custom(gameinfo.font, size: 17))
            Picker("Number of Letters", selection: $color){
                Text("White").tag(0)
                Text("Black").tag(1)
                Text("Gray").tag(2)
            }
            .frame(width: geo.size.width/2, alignment: .leading)
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
        }
        .onAppear{
            gameinfo.ladderColorNumber = gameinfo.defaults.integer(forKey: "Ladder Color")
            color = gameinfo.ladderColorNumber
        }
    }
    .padding()
    }
}



struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(GameInfo())
    }
}
