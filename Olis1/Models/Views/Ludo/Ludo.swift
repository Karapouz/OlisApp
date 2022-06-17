import SwiftUI

struct ProfilView: View {
    var grid : [GridItem] = Array(repeating: GridItem(.fixed(200)), count: 4)
    var body: some View {
        NavigationView{
            ZStack{
                Color(.black)
                
                //        Début de la partie haute du profil (Photo + Values fav )
                VStack(){
                    
                    Image("PruneEgidio")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(.white, lineWidth: 3))
                        .frame(width: 200, height: 150, alignment: .top)
                        .offset(x: -100, y: 30)
                    
                    
                    Text("Prune E")
                        .font(.system(size: 30, weight: .semibold, design: .default))
                        .offset(x: 70, y: -70)
                        .foregroundColor(.white)
                    
                    
                    
                    Text ("MES VALEURS")
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .offset(x: -100, y: 10)
                    
                    HStack{
                        VStack(alignment: .center){
                            
                            Image(systemName: "leaf")
                                .font(.largeTitle)
                                .foregroundColor(.green)
                            Text("Ecologie ")
                                .font(.system(size: 13, weight: .semibold, design: .default))
                        }
                        Spacer()
                        
                        VStack(alignment: .center){
                            
                            Image(systemName: "bolt.fill")
                                .font(.largeTitle)
                                .foregroundColor(.yellow)
                            Text("Persévérance ")
                                .font(.system(size: 13, weight: .semibold, design: .default))
                        }
                        Spacer()
                        
                        VStack(alignment: .center){
                            
                            Image(systemName: "paperplane.fill")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                            Text("Aventure ")
                                .font(.system(size: 13, weight: .semibold, design: .default))
                        }
                        
                    }
                    .padding(5)
                    .foregroundColor(.white)
                    .frame(width:360)
                    
                    
                    //            Fin de la partie haute du profil
                    
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyVGrid(columns : grid, spacing:5 ){
                            ForEach(eventList){oneEvent in
                                NavigationLink {
                                    DetailEvent(theEvent: oneEvent)
                                } label: {
                                    ExtractedViewOlisProfil(myEvent: oneEvent)
                                }
                                
                            }
                        }
                        
                    }.padding()
                }
                
                
                
                
                
                
                
                
                
                
            }.ignoresSafeArea()
            //   Fin de la ZStack
            
        }
        
        
    }
}




struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}



struct ExtractedViewOlisProfil: View {
    var myEvent:Event
    var body: some View {
        ZStack{
            
            Image(myEvent.eventPicture).resizable()
                .scaledToFill()
                .frame(width: 200, height: 190, alignment: .leading)
                .cornerRadius(10)
                .overlay(LinearGradient(colors: [Color(red: myEvent.eventSubject.subjectColorRed, green: myEvent.eventSubject.subjectColorGreen, blue: myEvent.eventSubject.subjectColorBlue),.black.opacity(0.4)], startPoint: .bottom, endPoint: .top))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .gray, radius: 1, x: 3, y: 3)
            VStack(alignment : .leading){
                Text("\(Image(systemName: "mappin")) \(myEvent.eventLocation)").font(.footnote.italic())
                Text("\(Image(systemName: "calendar")) \(myEvent.eventTime)").font(.footnote.bold())
                Spacer()
                HStack{
                    Text(myEvent.eventTitle)
                        .font(.system(size: 15, weight: .ultraLight, design: .serif))
                    
                }
            }.offset(x: -10, y: 10)
                .foregroundColor(.white)
                .padding()
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: myEvent.eventSubject.subjectColorRed, green: myEvent.eventSubject.subjectColorGreen, blue: myEvent.eventSubject.subjectColorBlue).opacity(0.9))
                .frame(width: 120, height: 20, alignment: .topTrailing)
                .overlay(Text("\(Image(systemName : myEvent.eventSubject.subjectEmoji)) \(myEvent.eventSubject.subjectName)")
                    .foregroundColor(.white)
                    .font(.footnote.smallCaps()))
                .offset(x: 40, y: -85)
        }
    }
}
