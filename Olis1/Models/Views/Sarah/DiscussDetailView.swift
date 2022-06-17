import SwiftUI

import AVFoundation
struct DiscussDetailView: View {
    var theChatToDisplay : Chat
    var body: some View {
        ZStack{
            Color(red : 232/255, green : 228/255, blue : 223/255)
            VStack(alignment : .leading){
                HStack{
                    Label("Quitter", systemImage: "chevron.compact.down")
                        .font(.footnote)
                        .foregroundColor(.brown)
                }.padding(.top)
                    .padding(.horizontal)
                ZStack{
                    VStack{
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color(red : 252/255, green : 248/255, blue : 243/255)).shadow(color : Color(red:theChatToDisplay.chatValue.subjectColorRed,green:theChatToDisplay.chatValue.subjectColorGreen, blue:theChatToDisplay.chatValue.subjectColorBlue), radius: 0, x: 0, y: -2)
                    }.offset(x: 0, y: 20)
                    VStack(alignment: .leading){
                        HStack(alignment: .center){
                            Text("\(Image(systemName : theChatToDisplay.chatValue.subjectEmoji))")
                            Text(theChatToDisplay.chatValue.subjectName)
                            Spacer()
                            Text("\(Image(systemName: "person.2.wave.2.fill"))")
                            Text("\(theChatToDisplay.tabUsers.count)")
                        }.font(.footnote.lowercaseSmallCaps())
                            .foregroundColor(.brown)
                        HStack{
                            ForEach(theChatToDisplay.tabUsers){person in
                                if person.isTalking == true {
                                    
                                    UserSpeaking(user: person)}
                            }
                            Spacer()
                        }
                        VStack{
                            Spacer()
                            Text("en mode écoute").font(.footnote.monospaced().italic())
                            ForEach(theChatToDisplay.tabUsers){person in
                                if person.isTalking == false {
                                    UserSpeaking(user: person)}
                            }
                            Spacer()
                            Image("ChatGif").resizable()
                        }
                        Spacer()
                        HStack{
                            Spacer()
                            Button {
                                //theChatToDisplay.tabUsers[0].isTalking = false
                                //passer en mode écoute seulement
                            } label: {
                                Label {
                                    Toggle("Je me tais", isOn: theChatToDisplay.tabUsers[0].$isTalking)
                                } icon: {
                                    Image(systemName: "mic.slash.circle.fill").font(.title)
                                }
                            }.foregroundColor(.brown)
                                .buttonStyle(.bordered)
                                .tint(Color(red : 244/255, green : 229/255, blue : 222/255))
                                .buttonBorderShape(.capsule)
                                .padding(.bottom)
                        }.padding()
                    }.padding()
                        .offset(x: 0, y: 25)
                }
            }
        }
    }
}




struct DiscussDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiscussDetailView(theChatToDisplay: chatFirst)
        AddDiscuss()
    }
}

