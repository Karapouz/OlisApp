import SwiftUI

struct EventView : View {
    var grid : [GridItem] = Array(repeating: GridItem(.fixed(200)), count: 4)
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                /*
                 Text("  Les évènements à venir ")
                 .font(.system(size: 30, weight: .ultraLight, design: .serif))
                 .fontWeight(.semibold)
                 
                 */
                HStack(){
                    Picker(selection: .constant(3), label: Text("Picker"))
                    {
                        Text("AUJOURD'HUI")
                            .font(.system(size: 12, weight: .semibold, design: .monospaced))
                            .foregroundColor(.gray).tag(1)
                        Text("CETTE SEMAINE ")
                            .font(.system(size: 12, weight: .semibold, design: .monospaced))
                            .foregroundColor(.gray).tag(2)
                        Text("CE MOIS CI")
                            .font(.system(size: 12, weight: .semibold, design: .monospaced))
                            .foregroundColor(.gray)
                        .underline().tag(3) }.pickerStyle(.segmented)
                    
                    
                    //} //Sarah trouve que le picker n'est pas la bonne solution et a changé la size 15 en 12
                    Spacer()
                    
                }
                .navigationTitle("Evènements")
                .font(.body)
                
                
                Spacer()
                //            1 ere ligne scroll view
                
                
                ScrollView(.horizontal,showsIndicators: false){
                    LazyVGrid(columns : grid, spacing:5 ){
                        ForEach(eventList){oneEvent in
                            NavigationLink {
                                DetailEvent(theEvent: oneEvent)
                            } label: {
                                ExtractedViewOlisSarah(myEvent: oneEvent)
                            }
                            
                        }
                    }
                }
                //           fin 1 ere ligne scroll view
                
                /*
                 //            2 eme ligne de scroll view
                 ScrollView(.horizontal,showsIndicators: false){
                 HStack {
                 
                 ForEach(eventList){oneEvent in ExtractedViewOlis(myEvent: oneEvent)}
                 }
                 }
                 */
                //.padding([.leading, .bottom], 6.0) // Sarah dit que trop de padding tue le padding
                //            Fin 2 ème ligne de scroll view
                
                //            Début de la Grande ligne
                ScrollView(.horizontal, showsIndicators: false){
                    
                    
                    
                    
                    HStack(){
                        ForEach(eventList){bigEvent in
                            GeometryReader { geometry in
                                ExtractedViewBigImage(myEvent: bigEvent)
                                    .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 20) / 20) , axis: (x: 0 , y: 20, z: 0))
                                
                            }
                            .frame(width: 270, height: 300)
                            
                            
                        }
                    }
                    
                }
            }.padding()
            
            
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
            .previewInterfaceOrientation(.portrait)
        
    }
}

struct ExtractedViewOlis: View {
    var myEvent:Event
    
    var body: some View {
        HStack{
            
            Image(myEvent.eventPicture).resizable()
                .cornerRadius(10).frame(width: 250, height: 150, alignment: .leading).overlay(Rectangle().padding([.top, .leading, .bottom], 1.0).foregroundColor(.black).opacity(0.2).overlay(Text(myEvent.eventTitle).font(.caption).foregroundColor(.white)))
            
            
            Image(myEvent.eventPicture)
                .resizable()
                .cornerRadius(10)
                .frame(width: 250, height: 150, alignment: .bottom)
                .overlay((Rectangle()))
                .foregroundColor(.yellow).opacity(0.2)
                .overlay(Text(myEvent.eventTitle))
            
            
            
            
            
        }
    }
}
struct ExtractedViewOlisSarah: View {
    var myEvent:Event
    var body: some View {
        ZStack{
            
            Image(myEvent.eventPicture).resizable()
                .scaledToFill()
                .frame(width: 200, height: 120, alignment: .leading)
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
                .offset(x: 40, y: -50)
        }
    }
}
struct ExtractedViewBigImage: View {
    var myEvent:Event
    var body: some View {
        ZStack{
            
            Image(myEvent.eventPicture).resizable()
                .scaledToFill()
                .frame(width: 250, height: 300, alignment: .leading)
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
            }
            .foregroundColor(.white)
            .padding()
            
            /*   RoundedRectangle(cornerRadius: 20)
             .foregroundColor(Color(red: myEvent.eventSubject.subjectColorRed, green: myEvent.eventSubject.subjectColorGreen, blue: myEvent.eventSubject.subjectColorBlue).opacity(0.9))
             .frame(width: 250, height: 300, alignment: .topTrailing)
             */
            .overlay(Text("\(Image(systemName : myEvent.eventSubject.subjectEmoji)) \(myEvent.eventSubject.subjectName)")
                        .foregroundColor(.white)
                        .font(.footnote.smallCaps()))
            
            
        }
    }
}

