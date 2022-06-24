
import SwiftUI

struct Gameover: View {
    
    @EnvironmentObject var gameinfo: GameInfo
    @State var animationAmount = 1
    
    
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                Text("Gameover!")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
        .ignoresSafeArea()
    }
}

struct Gameover_Previews: PreviewProvider {
    static var previews: some View {
        Gameover()
            .environmentObject(GameInfo())
    }
}

