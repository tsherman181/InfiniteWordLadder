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
            Color.blue
                .ignoresSafeArea()
            VStack{
                MenuButton()
                    .environmentObject(gameinfo)
                GeometryReader { geo in
                    ScrollView(.vertical){
                        Text("Acheivements")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        HStack{
                            Spacer()
                            ForEach(0..<3){ index1 in
                                VStack{
                                    ForEach(0..<gameinfo.saobj.numAch/3) {index2 in
                                        Text(gameinfo.saobj.achievementNames[index1+index2*3])
                                            .font(.caption)
                                            .frame(width: geo.size.width*0.3, height: geo.size.width*0.15, alignment: .center)
                                            .multilineTextAlignment(.center)
                                        Button(action: {
                                            print("here")
                                            if (min(Double(gameinfo.saobj.achievements[index1+index2*3])+0.5, 1.0) == 1.0){
                                                print("here1")
                                                rX = Double(Float.random(in: 0..<1))
                                                rY = Double(Float.random(in: 0..<1))
                                                withAnimation{animationAmount[index1+index2*3]+=Double(gameinfo.saobj.achievements[index1+index2*3]*360)
                                                }
                                            }
                                            else{
                                                print("dummy statement, fill in else later")
                                                //show how to get achievement
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
                                        .opacity(min(Double(gameinfo.saobj.achievements[index1+index2*3])+0.5, 1.0))
                                        .rotation3DEffect(.degrees(animationAmount[index1+index2*3]), axis: (x:rX, y:rY, z:0))
                                        .frame(width: geo.size.width*0.15, height: geo.size.width*0.15, alignment: .center)
                                        .padding([.bottom, .horizontal])
                                    }//ForEach
                                }//VStack
                            }//ForEach
                            Spacer()
                        }//HStack
                    }//ScrollView
                }//GeometryReader
                
                
                
                
                
                
            }//VStack
        }//ZStack
    }//View
}//Achievements

    


/*GeometryReader{ geo in
 HStack{
     Spacer()
     ForEach(0..<3){ index1 in
         VStack{
             ForEach(0..<3) {index2 in
                 Text(gameinfo.saobj.achievementNames[index1*3 + index2])
                 Button (action: {
                 if (min(Double(gameinfo.saobj.achievements[2])+0.5, 1.0) == 1){
                     rX = Double(Float.random(in: 0..<1))
                     rY = Double(Float.random(in: 0..<1))
                     withAnimation{animationAmount[2]+=Double(gameinfo.saobj.achievements[2]*360)}
                 }})
             {
             Image(systemName: "star.circle.fill")
                 .resizable()
                 .scaledToFit()
                 .symbolRenderingMode(.palette)
                 .foregroundStyle(.yellow, .orange)
                 .frame(width: geo.size.width*0.2)
                 .font(.largeTitle.weight(.bold))
                 .imageScale(.large)
                 .foregroundStyle(
                         .ultraThickMaterial,
                         .ultraThinMaterial
                     )
                 .rotation3DEffect(.degrees(animationAmount[1]), axis: (x:rX, y:rY, z:0))
                 .opacity(min(Double(gameinfo.saobj.achievements[1])+0.5, 1.0))
             }
             .padding([.bottom, .horizontal])
             }
             }
     }
     Spacer()
     }
}*/

    
    
    
    
    /*
    var body: some View {
        ZStack {
            Color.blue
            VStack {
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
                HStack{
                    Spacer()
                    Text("Score 10 Points")
                        .padding(.leading)
                    Spacer()
                    Text("Score 50 Points")
                    Spacer()
                    Text("Score 100 Points")
                        .padding(.trailing)
                    Spacer()
                }
                .foregroundColor(.white)
                .font(.caption)
                HStack{
                Spacer()
                Button(action: {
                    if (min(Double(gameinfo.saobj.achievements[0])+0.5, 1.0) == 1){
                        rX = Double(Float.random(in: 0..<1))
                        rY = Double(Float.random(in: 0..<1))
                        withAnimation{animationAmount[0]+=Double(360*gameinfo.saobj.achievements[0])}
                    }
                }){
                    Image(systemName: "star.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow, .orange)
                        //.opacity(50)
                        .font(.largeTitle.weight(.bold))
                        .imageScale(.large)
                        .foregroundStyle(
                                .ultraThickMaterial,
                                .ultraThinMaterial
                            )
                        .rotation3DEffect(.degrees(animationAmount[0]), axis: (x:rX, y:rY, z:0))
                        .opacity(min(Double(gameinfo.saobj.achievements[0])+0.5, 1.0))
                    }
                Spacer()
                Button(action: {
                    if (min(Double(gameinfo.saobj.achievements[1])+0.5, 1.0) == 1){
                        rX = Double(Float.random(in: 0..<1))
                        rY = Double(Float.random(in: 0..<1))
                        withAnimation{animationAmount[1]+=Double(gameinfo.saobj.achievements[1]*360)
                        }
                    }
                }){
                    Image(systemName: "star.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow, .orange)
                        //.opacity(50)
                        .font(.largeTitle.weight(.bold))
                        .imageScale(.large)
                        .foregroundStyle(
                                .ultraThickMaterial,
                                .ultraThinMaterial
                            )
                        .rotation3DEffect(.degrees(animationAmount[1]), axis: (x:rX, y:rY, z:0))
                        .opacity(min(Double(gameinfo.saobj.achievements[1])+0.5, 1.0))
                    }
                Spacer()
                Button(action: {
                    if (min(Double(gameinfo.saobj.achievements[2])+0.5, 1.0) == 1){
                        rX = Double(Float.random(in: 0..<1))
                        rY = Double(Float.random(in: 0..<1))
                        withAnimation{animationAmount[2]+=Double(gameinfo.saobj.achievements[2]*360)}
                    }
                }){
                    Image(systemName: "star.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow, .orange)
                        //.opacity(50)
                        .font(.largeTitle.weight(.bold))
                        .imageScale(.large)
                        .foregroundStyle(
                                .ultraThickMaterial,
                                .ultraThinMaterial
                            )
                        .rotation3DEffect(.degrees(animationAmount[2]), axis: (x:rX, y:rY, z:0))
                        .opacity(min(Double(gameinfo.saobj.achievements[2])+0.5, 1.0))
                    }
                Spacer()
                }
            }
        }
        .ignoresSafeArea()
    }
}
*/


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
