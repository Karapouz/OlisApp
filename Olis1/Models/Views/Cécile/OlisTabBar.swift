



import SwiftUI

struct TabBar: View {
    
    var body: some View {
        TabView{
            
            
            HomeView()
                .tabItem(){
                    Label("Home", systemImage: "house.fill")
                }
            
            TableauDeStat()
                .tabItem(){
                    Label("Statistiques", systemImage: "chart.line.uptrend.xyaxis")
                }
                .badge(10)
            
            EventView()
                .tabItem(){
                    Label("Evènements", systemImage: "calendar")
                }
            ProfileView()
                .tabItem(){
                    Label("Profil", systemImage: "person.crop.circle.fill")
                }
            ChatView()
                .tabItem(){
                    Label("Chat", systemImage: "message.fill")
                }
            
            
            
            
        }
        
        
        
    }
}

struct OlisTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
