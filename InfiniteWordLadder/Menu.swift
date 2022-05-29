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
    
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    
    var body: some View {
        ZStack{
            Color(red:0.0, green:0.5, blue:1.0)
            VStack{
                Button("Infinite Word Ladder"){
                    gameinfo.currPage = .IWL
                }
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
                .frame(width: deviceWidth/1.5, alignment: .center)
                .background(Color.white)
                .cornerRadius(40)
                .foregroundColor(Color.blue)
                .padding()
                
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
            }
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
