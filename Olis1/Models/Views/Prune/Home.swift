import SwiftUI
import SwiftUICharts

struct HomeView: View{
    @State var modalPresent = false
    @State var bellBadge : Int = 0
    let tabInter = ["  Intéressé(e) ?","  Participe","  Ne peux pas"]
    let tabIterIcon = ["star.square.fill","checkmark.square.fill","x.square.fill"]
    var body: some View {
        NavigationView{
            ZStack{
                Color(.black)
                    
                VStack (alignment:.leading) {
                    ZStack{
                        
                        // Evenement Central
                        HStack(alignment : .center){
                            Spacer()
                            CarouselSarah()
                            Spacer()
                        }.offset(x: 0, y: -30)
                        
                        HStack {
                            // Logo Image en Texte
                            Image ("Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70, alignment: .center)
                                .offset(x: -10, y:-5)
                            
                            Spacer()
                            
                            // Button (Alerte / Profil)
                            Button {
                                //
                            } label: {
                                if (bellBadge == 1){
                                    Image (systemName: "bell.fill")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .overlay(Circle()
                                                    .foregroundColor(.green)
                                                    .frame(width: 10, height: 10, alignment: .center)
                                                    .background(.green).clipShape(Circle()).offset(x: 7, y:-7))
                                    //.badge(.red)
                                }else{
                                    Image (systemName: "bell.fill")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                            }.padding()
                        }
                        .offset(x: 0 , y: -220)
                        .padding(5)
                        
                        HStack (alignment : .center){
                            
                            //Interresse?
                            Spacer()
                            Picker (selection: $bellBadge, label: Text ("GoToTheEvent")) {
                                ForEach(0..<tabInter.count){ interName in HStack{
                                    Image(systemName: tabIterIcon[interName])
                                    Spacer()
                                    Text(tabInter[interName]).foregroundColor(.black)
                                }.tag(interName)
                                    
                                }
                            }.padding(5)
                                .background(.white)
                                .cornerRadius(5)
                            
                            // Button Partage
                            
                            Button ("\(Image (systemName: "arrowshape.turn.up.forward.circle.fill"))") {
                                modalPresent.toggle()
                            }.font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .sheet(isPresented: $modalPresent){
                                    ShareSheetView(activityItems:["On se retrouve autour d'un \(cafeThomasPesquet.eventTitle) sur Olis. C'est notre nouvelle app, pour animer nos valeurs entre collègues\n\n",UIImage(named: "\(cafeThomasPesquet.eventPicture)")!,URL(string: "https://simplon.co/formation/foundation/24")!])
                                    
                                }
                            Spacer()
                        }.offset(x:0, y:200)
                    }
                    
                        Section("   Prochainement"){
                            ValeursView()
                        }.foregroundColor(.white)
                        .font(.body.smallCaps().bold())
                        .offset(x: 0 , y: -30)
                        
                }
            }.navigationBarHidden(true)
        }
    }
}


struct ValeursView : View {
    var discussLive = tabChatBlabla
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(discussLive){chat in CelluleProchainement(subjectValue: chat.chatValue)}
                }.padding(.horizontal)
            }
        }
    }
}

struct CelluleProchainement : View {
    var subjectValue : SubjectValue
    var body: some View {
        Button {
            // filtrer la vue Chat
        } label: {
            ZStack{
                Image(subjectValue.subjectImage).resizable().scaledToFill().blur(radius: 0.8)
                LinearGradient(colors: [Color(red: subjectValue.subjectColorRed, green: subjectValue.subjectColorGreen, blue: subjectValue.subjectColorBlue, opacity: 1),Color(red: subjectValue.subjectColorRed, green: subjectValue.subjectColorGreen, blue: subjectValue.subjectColorBlue, opacity: 0.5),.clear], startPoint: .bottomLeading, endPoint: .trailing)
                VStack(alignment: .leading){
                    Image(systemName: subjectValue.subjectEmoji).font(.headline)
                    Text(subjectValue.subjectName).font(.footnote.smallCaps())
                }.foregroundColor(.white)
            }.frame(width:(80), height: 120)
                .cornerRadius(10)
                .shadow(color: Color(red: subjectValue.subjectColorRed, green: subjectValue.subjectColorGreen, blue: subjectValue.subjectColorBlue, opacity: 1), radius: 0.5, x:-5, y:0)
                .padding(5)
        }.offset(x: -5, y: 0)
    }
}

struct CarouselSarah : View{
    let timerCarou = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 2
    var body: some View {
        TabView(selection : $currentIndex){
            ForEach(eventList){ ev in ExtractedViewBigImageSarah(myBigEvent: ev)}
        }.tabViewStyle(.page(indexDisplayMode: .never))//PageTabViewStyle())
            .onReceive(timerCarou, perform: {
                tps in withAnimation{
                    //let _ = print(currentIndex)
                    currentIndex = currentIndex < eventList.count ? currentIndex + 1 : 0
                }
            })
    }
}


struct ExtractedViewBigImageSarah: View {
    var myBigEvent:Event
    var body: some View {
        VStack{
            HStack {
                Image (myBigEvent.eventPicture)
                    .resizable()
                    .shadow(radius: 2)
                    .scaledToFill()
                //.frame (width: .infinity, height: 400)
                    .overlay(
                        Rectangle()
                            .foregroundColor(.white)
                            .opacity(0.2)
                            .overlay(.black.opacity(0.3))
                            .overlay(
                                Text ( myBigEvent.eventTitle)
                                    .font(.title3
                                            .bold()
                                            .weight(.heavy).smallCaps())
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .frame(width: 300, height: 50, alignment: .center)
                                //.minimumScaleFactor(0.8)
                                    .foregroundColor(.white)
                                    .shadow(color: Color(red: myBigEvent.eventSubject.subjectColorRed, green: myBigEvent.eventSubject.subjectColorGreen ,blue :myBigEvent.eventSubject.subjectColorBlue) , radius: 1, x: 1, y: 1)
                                    .shadow(color: .black , radius: 1, x: 1, y: 1)
                                    .offset(x: 0, y: 70)))
                
            }//.padding([.leading, .bottom], 6.0) // Sarah a ajouté ça
            .mask(LinearGradient(stops:[Gradient.Stop(color: .clear, location: 0.1), Gradient.Stop(color: .white, location: 0.3),], startPoint: .bottomLeading, endPoint: .topLeading))
            Text("\(Image(systemName : myBigEvent.eventSubject.subjectEmoji)) \(myBigEvent.eventSubject.subjectName) • \(myBigEvent.eventOrganizer) • \(Image(systemName: "person.3.sequence.fill")) \(myBigEvent.eventParticipantsNumber) ")
                .font(.footnote.smallCaps().weight(.light))
                .foregroundColor(.white).offset(x: 0, y: -70)
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


