import SwiftUI

struct DetailEvent : View {
    var theEvent : Event
    var body: some View {
        NavigationView {
            ZStack{
                Color(red : 232/255, green : 228/255, blue : 223/255) // Sarah is obsessed by Cream
                VStack{
                    Image(theEvent.eventPicture)
                        .resizable()
                        .overlay(LinearGradient(colors: [Color(red: theEvent.eventSubject.subjectColorRed, green: theEvent.eventSubject.subjectColorGreen, blue: theEvent.eventSubject.subjectColorBlue),.clear], startPoint: .bottom, endPoint: .top))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: .infinity, height: 300, alignment: .center)
                        .shadow(color: Color(red: theEvent.eventSubject.subjectColorRed, green: theEvent.eventSubject.subjectColorGreen, blue: theEvent.eventSubject.subjectColorBlue), radius: 1, x: 0, y: 6)
                        .ignoresSafeArea()
                    Spacer()
                }
                Text(theEvent.eventTitle)
                    .font(.title.smallCaps())
                    .font(.system(size: 12, weight: .semibold, design: .monospaced))
                    .foregroundColor(.black)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -90)
                VStack{
                    Spacer()
                    HStack{
                        Text("🤵\(theEvent.eventOrganizer)")
                            .font(.system(size: 15, weight: .semibold, design: .monospaced))
                            .foregroundColor(.black)
                        Spacer()
                        Text("📍\(theEvent.eventLocation)")
                            .font(.system(size: 15, weight: .semibold, design: .monospaced))
                            .foregroundColor(.black)
                        Spacer()
                        Text("\(Image(systemName: "person.crop.circle.fill.badge.checkmark"))\(theEvent.eventParticipantsNumber)")
                    }.padding()
                    ScrollView{
                        Text("But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. ")
                            .padding()
                            .font(.system(size: 19, weight: .semibold, design: .rounded))
                            .foregroundColor(.black)
                    }
                }.offset(x: 0, y: 200)
            }
        }
    }
}

struct DetailEvent_Previews: PreviewProvider {
    static var previews: some View {
        DetailEvent(theEvent: cafeThomasPesquet)
    }
}
