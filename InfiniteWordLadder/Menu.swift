//
//  Menu.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/28/22.
//

import SwiftUI

struct Menu: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @State var color1 = Color(red:0.0, green:0.0, blue:1.0)
    @State var color2 = Color(red:0.0, green:0.5, blue:1.0)
    @State private var angle = 0.0
    @State private var opacity = 1.0
    @State private var scale = 1.0
    
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    
    var body: some View {
        ZStack{
            Color(red:0.0, green:0.5, blue:1.0)
            ZStack{
            HStack{
                Rectangle()
                   .fill(.white)
                   .frame(width: deviceWidth/8, height: deviceHeight/1.75)
                   .cornerRadius(20)
                   .padding(.trailing)
                   .padding(.trailing)
                Rectangle()
                   .fill(.white)
                   .frame(width: deviceWidth/8, height: deviceHeight/1.75)
                   .cornerRadius(20)
                   .padding(.leading)
                   .padding(.leading)
            }
            VStack{
                Button("Infinite Word Ladder"){
                    angle += 360.0
                    opacity -= 1
                    scale -= 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                        gameinfo.currPage = .IWL
                    }
                }
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
                .frame(width: deviceWidth/1.5, alignment: .center)
                .background(Color.white)
                .cornerRadius(40)
                .foregroundColor(Color.blue)
                .padding()
//                .rotationEffect(.degrees(angle))
//                .animation(.easeInOut, value: angle)
//                .opacity(opacity)
//                .animation(.easeInOut, value: opacity)
//                .scaleEffect(scale)
//                .animation(.easeIn, value: scale)
                
                Button("Instructions"){
                    gameinfo.currPage = .instructions
                }
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
                .frame(width: deviceWidth/1.5, alignment: .center)
                .background(Color.white)
                .cornerRadius(40)
                .foregroundColor(Color.blue)
                .padding()
//                .rotationEffect(.degrees(angle))
//                .animation(.easeInOut, value: angle)
//                .opacity(opacity)
//                .animation(.easeInOut, value: opacity)
//                .scaleEffect(scale)
//                .animation(.easeIn, value: scale)
                
                Button("Statistics"){
                    gameinfo.currPage = .stats
                }
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
                .frame(width: deviceWidth/1.5, alignment: .center)
                .background(Color.white)
                .cornerRadius(40)
                .foregroundColor(Color.blue)
                .padding()
//                .rotationEffect(.degrees(angle))
//                .animation(.easeInOut, value: angle)
//                .opacity(opacity)
//                .animation(.easeInOut, value: opacity)
//                .scaleEffect(scale)
//                .animation(.easeIn, value: scale)
                
                Button("Acheivements"){
                    gameinfo.currPage = .achievements
                }
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
                .frame(width: deviceWidth/1.5, alignment: .center)
                .background(Color.white)
                .cornerRadius(40)
                .foregroundColor(Color.blue)
                .padding()
//                .rotationEffect(.degrees(angle))
//                .animation(.easeInOut, value: angle)
//                .opacity(opacity)
//                .animation(.easeInOut, value: opacity)
//                .scaleEffect(scale)
//                .animation(.easeIn, value: scale)
            }
            //.rotationEffect(.degrees(angle))
            //.animation(.easeInOut, value: angle)
        }
        .opacity(opacity)
        .animation(.easeOut, value: opacity)
        .scaleEffect(scale)
        .animation(.easeOut, value: scale)
        }
        .ignoresSafeArea()
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
            .environmentObject(GameInfo())
    }
}
