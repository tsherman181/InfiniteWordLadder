//
//  Credits.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 7/18/22.
//

import SwiftUI

struct Credits: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @State private var animationAmount = Array(repeating: 0.0, count: 2)
    @State private var rX = 0.0
    @State private var rY = 0.0
    
    var body: some View {
        ZStack{
            Color(gameinfo.backgroundColor).ignoresSafeArea()
            GeometryReader { geo in
                VStack {
                    MenuButton()
                    Text("Thanks for playing our game!")
                        .foregroundColor(.white)
                        .font(Font.custom(gameinfo.font, size: 34))
                        .multilineTextAlignment(.center)
                        .frame(height: geo.size.height/6)
                    HStack {
                        Button {
                            rX = Double(Float.random(in: 0..<1))
                            rY = Double(Float.random(in: 0..<1))
                            withAnimation{
                                animationAmount[0]+=360
                            }
                            
                        } label: {
                            Image("tommy")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                        }
                        .clipShape(Circle())
                        .rotation3DEffect(.degrees(animationAmount[0]), axis: (x: 1, y: 0, z: 0))
                        Button {
                            rX = Double(Float.random(in: 0..<1))
                            rY = Double(Float.random(in: 0..<1))
                            withAnimation{
                                animationAmount[1]+=360
                            }
                        } label: {
                            Image("erika")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                        }
                        .clipShape(Circle())
                        .rotation3DEffect(.degrees(animationAmount[1]), axis: (x: 0, y: 1, z: 0))
                    }
                    
                    Text("Built by Tom Sherman and Erika Webb")
                        .foregroundColor(.white)
                        .font(Font.custom(gameinfo.font, size: 34))
                        .multilineTextAlignment(.center)
                        .frame(height: geo.size.height/5)
                }
            }
            
        }
    }
}

struct Credits_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
    }
}
