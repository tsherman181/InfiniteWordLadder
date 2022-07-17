//
//  Achievments.swift
//  InfiniteWordLadder
//
//  Created by Tom Sherman on 5/29/22.
//

import SwiftUI




struct Achievements: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @State private var animationAmount = Array(repeating: 0.0, count: 15)
    @State private var rX = 0.0
    @State private var rY = 0.0
    
    var body: some View {
        ZStack{
            Color(gameinfo.backgroundColor).ignoresSafeArea()
            VStack{
                MenuButton()
                    .environmentObject(gameinfo)
                Text("Acheivements")
                    .font(Font.custom(gameinfo.font, size: 34))
                    .foregroundColor(.white)
                GeometryReader { geo in
                    ScrollView(.vertical){
                        HStack{
                            ForEach(0..<3){ index1 in
                                VStack{
                                    ForEach(0..<gameinfo.saobj.numAch/3) {index2 in
                                        Text(gameinfo.saobj.achievementNames[index1+index2*3])
                                            .font(Font.custom(gameinfo.font, size: 12))
                                            .frame(width: geo.size.width*0.3, height: geo.size.width*0.15, alignment: .center)
                                            .multilineTextAlignment(.center)
                                        Coin(rX: $rX, rY: $rY, index1: index1, index2: index2, animationAmount: $animationAmount)
                                            .environmentObject(gameinfo)
                                        .opacity(min(Double(gameinfo.saobj.achievements[index1+index2*3])+0.5, 1.0))
                                        .rotation3DEffect(.degrees(animationAmount[index1+index2*3]), axis: (x:rX, y:rY, z:0))
                                        .frame(width: geo.size.width*0.25, height: geo.size.width*0.25, alignment: .center)
                                        .padding([.bottom, .horizontal])
                                    }//ForEach
                                }//VStack
                            }//ForEach
                        }//HStack
                    }//ScrollView
                    .frame(width: geo.size.width, height: geo.size.height)
                }//GeometryReader
            }//VStack
        }//ZStack
    }//View
}//Achievements questionmark.circle


struct Coin: View{
    
    @Binding var rX: Double
    @Binding var rY: Double
    var index1: Int
    var index2: Int
    @Binding var animationAmount: [Double]
    
    @State private var opac = 0.0
    
    @EnvironmentObject var gameinfo: GameInfo
    var body: some View{
        GeometryReader{ geo in
        ZStack{
            Button(action: {
                print("here \(rX) and \(rY)")
                if (min(Double(gameinfo.saobj.achievements[index1+index2*3])+0.5, 1.0) == 1.0){
                    print("here1")
                    rX = Double(Float.random(in: 0..<1))
                    rY = Double(Float.random(in: 0..<1))
                    withAnimation{animationAmount[index1+index2*3]+=Double(gameinfo.saobj.achievements[index1+index2*3]*360)
                    }
                }
                else{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation{opac-=1}
                    }
                    withAnimation{opac+=1}
                }
            })
            {
            Image(systemName: "star.circle.fill")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .orange)
                .font(.largeTitle.weight(.bold))
                .imageScale(.large)
                .foregroundStyle(
                        .ultraThickMaterial,
                        .ultraThinMaterial
                    )
            }
            .frame(width: geo.size.width*0.8, height: geo.size.height*0.8)
            //.border(.green)
            Text(gameinfo.saobj.achievementDesc[index1+index2*3])
                .onChange(of: opac){
                    newValue in
                }
                .opacity(opac)
                .foregroundColor(.black)
                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                //.border(.red)
                .font(Font.custom(gameinfo.font, size: 12))
        }
        }
        
        
        
    }
}








//struct Achievements: View {
//
//    @EnvironmentObject var gameinfo: GameInfo
//    @State private var animationAmount = Array(repeating: 0.0, count: 15)
//    @State private var rX = 0.0
//    @State private var rY = 0.0
//
//    var body: some View {
//        ZStack{
//            Color(gameinfo.backgroundColor).ignoresSafeArea()
//            VStack{
//                MenuButton()
//                    .environmentObject(gameinfo)
//                GeometryReader { geo in
//                    ScrollView(.vertical){
//                        Text("Acheivements")
//                            .font(Font.custom(gameinfo.font, size: 34))
//                            .foregroundColor(.white)
//                        HStack{
//                            Spacer()
//                            ForEach(0..<3){ index1 in
//                                VStack{
//                                    ForEach(0..<gameinfo.saobj.numAch/3) {index2 in
//                                        Text(gameinfo.saobj.achievementNames[index1+index2*3])
//                                            .font(Font.custom(gameinfo.font, size: 12))
//                                            .frame(width: geo.size.width*0.3, height: geo.size.width*0.15, alignment: .center)
//                                            .multilineTextAlignment(.center)
//                                            Button(action: {
//                                                print("here")
//                                                if (min(Double(gameinfo.saobj.achievements[index1+index2*3])+0.5, 1.0) == 1.0){
//                                                    print("here1")
//                                                    rX = Double(Float.random(in: 0..<1))
//                                                    rY = Double(Float.random(in: 0..<1))
//                                                    withAnimation{animationAmount[index1+index2*3]+=Double(gameinfo.saobj.achievements[index1+index2*3]*360)
//                                                    }
//                                                }
//                                                else{
//                                                    print("dummy statement, fill in else later")
//                                                    //show how to get achievement
//                                                }
//                                            })
//                                        {
//                                        Image(systemName: "star.circle.fill")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .symbolRenderingMode(.palette)
//                                            .foregroundStyle(.yellow, .orange)
//                                            .font(.largeTitle.weight(.bold))
//                                            .imageScale(.large)
//                                            .foregroundStyle(
//                                                    .ultraThickMaterial,
//                                                    .ultraThinMaterial
//                                                )
//                                        }
//                                        .opacity(min(Double(gameinfo.saobj.achievements[index1+index2*3])+0.5, 1.0))
//                                        .rotation3DEffect(.degrees(animationAmount[index1+index2*3]), axis: (x:rX, y:rY, z:0))
//                                        .frame(width: geo.size.width*0.15, height: geo.size.width*0.15, alignment: .center)
//                                        .padding([.bottom, .horizontal])
//                                    }//ForEach
//                                }//VStack
//                            }//ForEach
//                            Spacer()
//                        }//HStack
//                    }//ScrollView
//                }//GeometryReader
//            }//VStack
//        }//ZStack
//    }//View
//}//Achievements questionmark.circle






struct MenuButton: View{
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
        }
        .padding(.bottom)
}
}











struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements()
            .environmentObject(GameInfo())
    }
}
