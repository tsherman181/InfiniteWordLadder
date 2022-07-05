//
//  Menu.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/28/22.
//

import SwiftUI

struct Menu: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @State private var angle = 0.0
    @State private var opacity = 1.0
    @State private var scale = 1.0
    
    var body: some View {
        ZStack{
            Color(gameinfo.backgroundColor).ignoresSafeArea()
            GeometryReader{ geo in
                ZStack{
                    HStack(spacing: 0) {
                        Rectangle()
                            .foregroundColor(Color(gameinfo.backgroundColor))
                            .frame(width: geo.size.width * 0.20)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.20, height: geo.size.height*0.875)
                            .cornerRadius(30)
                        Rectangle()
                            .foregroundColor(Color(gameinfo.backgroundColor))
                            .frame(width: geo.size.width * 0.20)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.20, height: geo.size.height*0.875)
                            .cornerRadius(30)
                        Rectangle()
                            .foregroundColor(Color(gameinfo.backgroundColor))
                            .frame(width: geo.size.width * 0.20)
                    }
                    
                    VStack{
                        Button("Infinite Word Ladder"){
                            //withAnimation{
                            //    angle += 360.0
                            //}
                            //For rotation
                            opacity -= 1
                            scale -= 1
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                gameinfo.currPage = .IWL
                            }}
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: geo.size.width*0.85, height: geo.size.height*0.10)
                        .background(Color.white)
                        .cornerRadius(40)
                        .foregroundColor(Color(gameinfo.backgroundColor))
                        .padding()
                        Button("Instructions"){
                            angle += 360.0
                            opacity -= 1
                            scale -= 1
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                gameinfo.currPage = .instructions
                            }
                        }
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: geo.size.width*0.85, height: geo.size.height*0.10)
                        .background(Color.white)
                        .cornerRadius(40)
                        .foregroundColor(Color(gameinfo.backgroundColor))
                        .padding()
                        Button("Statistics"){
                            angle += 360.0
                            opacity -= 1
                            scale -= 1
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                gameinfo.currPage = .stats
                            }
                        }
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: geo.size.width*0.85, height: geo.size.height*0.10)
                        .background(Color.white)
                        .cornerRadius(40)
                        .foregroundColor(Color(gameinfo.backgroundColor))
                        .padding()
                        Button("Achievements"){
                            angle += 360.0
                            opacity -= 1
                            scale -= 1
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                gameinfo.currPage = .achievements
                            }
                        }
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: geo.size.width*0.85, height: geo.size.height*0.10)
                        .background(Color.white)
                        .cornerRadius(40)
                        .foregroundColor(Color(gameinfo.backgroundColor))
                        .padding()
                        Button("Settings"){
                            angle += 360.0
                            opacity -= 1
                            scale -= 1
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                gameinfo.currPage = .settings
                            }
                        }
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: geo.size.width*0.85, height: geo.size.height*0.10)
                        .background(Color.white)
                        .cornerRadius(40)
                        .foregroundColor(Color(gameinfo.backgroundColor))
                        .padding()
                    }
                }
            }
            .opacity(opacity)
            .animation(.easeOut, value: opacity)
            .scaleEffect(scale)
            .animation(.easeOut, value: scale)
            .rotationEffect(.degrees(angle))
        }
    }
}
    
    
    

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
            .environmentObject(GameInfo())
    }
}



/*var deviceWidth: CGFloat {
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
            .frame(width: deviceWidth/8, height: deviceHeight/1.5)
            .cornerRadius(20)
            .padding(.trailing)
            .padding(.trailing)
         Rectangle()
            .fill(.white)
            .frame(width: deviceWidth/8, height: deviceHeight/1.5)
            .cornerRadius(20)
            .padding(.leading)
            .padding(.leading)
     }
     VStack{
         Button("Infinite Word Ladder"){
             //withAnimation{
             //    angle += 360.0
             //}
             //For rotation
             opacity -= 1
             scale -= 1
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
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
         Button("Instructions"){
             angle += 360.0
             opacity -= 1
             scale -= 1
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                 gameinfo.currPage = .instructions
             }
         }
         .font(.system(size: 20, weight: .bold, design: .rounded))
         .padding()
         .frame(width: deviceWidth/1.5, alignment: .center)
         .background(Color.white)
         .cornerRadius(40)
         .foregroundColor(Color.blue)
         .padding()
         Button("Statistics"){
             angle += 360.0
             opacity -= 1
             scale -= 1
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                 gameinfo.currPage = .stats
             }
         }
         .font(.system(size: 20, weight: .bold, design: .rounded))
         .padding()
         .frame(width: deviceWidth/1.5, alignment: .center)
         .background(Color.white)
         .cornerRadius(40)
         .foregroundColor(Color.blue)
         .padding()
         Button("Acheivements"){
             angle += 360.0
             opacity -= 1
             scale -= 1
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                 gameinfo.currPage = .achievements
             }
         }
         .font(.system(size: 20, weight: .bold, design: .rounded))
         .padding()
         .frame(width: deviceWidth/1.5, alignment: .center)
         .background(Color.white)
         .cornerRadius(40)
         .foregroundColor(Color.blue)
         .padding()
         Button("Settings"){
             angle += 360.0
             opacity -= 1
             scale -= 1
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                 gameinfo.currPage = .settings
             }
         }
         .font(.system(size: 20, weight: .bold, design: .rounded))
         .padding()
         .frame(width: deviceWidth/1.5, alignment: .center)
         .background(Color.white)
         .cornerRadius(40)
         .foregroundColor(Color.blue)
         .padding()
     }
 }
 .opacity(opacity)
 .animation(.easeOut, value: opacity)
 .scaleEffect(scale)
 .animation(.easeOut, value: scale)
 .rotationEffect(.degrees(angle))
 }
 .ignoresSafeArea()
}
}*/
