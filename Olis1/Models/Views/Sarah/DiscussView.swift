import SwiftUI
// DASAGN de la cellule Sujet dans une List
struct CelluleValeur: View {
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
            }.frame(width:(100), height: 50)
                .cornerRadius(10)
                .shadow(color: Color(red: subjectValue.subjectColorRed, green: subjectValue.subjectColorGreen, blue: subjectValue.subjectColorBlue, opacity: 1), radius: 0.5, x:-5, y:0)
                .padding(5)
        }
    }
}
struct CelluleValeurToDiscuss: View {
    var subjectValue : SubjectValue
    var body: some View {
        /*
        Button {
            tabChatBlabla.append(Chat(chatValue: subjectValue, tabUsers: [sarah]))
            print(tabChatBlabla.count)
        } label: { */
            ZStack{
                Image(subjectValue.subjectImage).resizable().scaledToFill().blur(radius: 0.8)
                LinearGradient(colors: [Color(red: subjectValue.subjectColorRed, green: subjectValue.subjectColorGreen, blue: subjectValue.subjectColorBlue, opacity: 1),Color(red: subjectValue.subjectColorRed, green: subjectValue.subjectColorGreen, blue: subjectValue.subjectColorBlue, opacity: 0.5),.clear], startPoint: .bottomLeading, endPoint: .trailing)
                VStack(alignment: .center){
                    Image(systemName: subjectValue.subjectEmoji).font(.title)
                    Text(subjectValue.subjectName).font(.footnote.smallCaps())
                }.foregroundColor(.white)
            }.frame(width:(85), height: 80)
                .cornerRadius(10)
                .shadow(color: Color(red: subjectValue.subjectColorRed, green: subjectValue.subjectColorGreen, blue: subjectValue.subjectColorBlue, opacity: 1), radius: 0.5, x:-5, y:0)
        //}
    }
}
/*
 struct CelluleValeur_Previews: PreviewProvider {
 static var previews: some View {
 CelluleValeur(subjectValue: laValeurEntente)
 }
 }
 */
// Création de nos évènements
//var eventFirst = Event(eventPicture: <#T##String#>, eventTitle: <#T##String#>, eventSubject: <#T##SubjectValue#>, eventLocation: <#T##String#>, eventTime: <#T##Date#>, eventParticipantsNumber: <#T##Int#>, eventOrganizer: <#T##User#>)

// Création de nos users
//var userFirst = User(userName: Sarah, userPicture: "Liberté", userFavSub: [laValeurEntente,laValeurLiberte,laValeurSagesse], isOrganizer: false, tabEvents: <#T##[Event]#>)

// Création de nos discussions
//var discussionFirst = Chat(chatValue: laValeurLiberte, tabUsers: <#T##[User]#>)


// Rejoindre une discussion

// DASAGN de la cellule Chat dans une List
struct CelluleDiscuss: View {
    @State private var isShareSheetPresented = false
    var discuss : Chat
    var body: some View {
        ZStack{
            VStack(alignment: .center){
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: .infinity, height: 190, alignment: .center)
                    .padding(.bottom)
                    .shadow(color: (Color(red: discuss.chatValue.subjectColorRed,green: discuss.chatValue.subjectColorGreen ,blue:discuss.chatValue.subjectColorBlue)), radius: 0.5, x: 5, y: 5)
                    .foregroundColor(Color(red : 252/255, green : 248/255, blue : 243/255))
                    .padding(.horizontal)
                
            }
            HStack{
                Text(" 💬 Discussion").font(.caption).foregroundColor(.secondary).offset(x:-5, y:-75)
                Text("\(Image(systemName: discuss.chatValue.subjectEmoji)) \(discuss.chatValue.subjectName )").font(.caption).foregroundColor(.primary).offset(x:-5, y:-75)
                Spacer()
                OpenModalShareDiscuss(theChatToShare: discuss)
            }.padding(30)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .center){
                    ForEach(0..<discuss.tabUsers.count){ individu in
                        UserSpeaking(user: discuss.tabUsers[individu])
                    }
                }
            }.padding(30)
            HStack{
                Spacer()
                Image(systemName: "person.2.wave.2.fill").foregroundColor(.secondary).font(.caption)
                Text("\(discuss.tabUsers.count)").foregroundColor(.secondary).font(.caption)
                OpenModalDiscussLive(theChatToShare: discuss)
            }.padding(30)
                .offset(x: 0, y: 65)
        }
    }
}


struct DiscussView: View {
    var body: some View {
        List(tableauDeValeurs){ val in CelluleValeur(subjectValue: val)}
    }
}




struct Subject_Previews: PreviewProvider {
    static var previews: some View {
        CelluleValeurToDiscuss(subjectValue: laValeurLiberte)
    }
}
