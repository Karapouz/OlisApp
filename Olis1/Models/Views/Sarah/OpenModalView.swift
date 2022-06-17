import SwiftUI

struct OpenModalShareDiscuss: View {
    var theChatToShare : Chat
    // Quand cette variable est true la modal est présente
    @State private var modalPresent = false
    var body: some View {
        
        Button("\(Image(systemName: "arrowshape.turn.up.forward"))") {
            modalPresent.toggle()
        }.foregroundColor(.secondary).offset(x:-5, y:-75)
            .sheet(isPresented: $modalPresent) {
                // Vue affichée par la modal
                CelluleDiscuss(discuss: theChatToShare)
                ShareSheetView(activityItems:["On discute \(theChatToShare.chatValue.subjectName) sur Olis. C'est notre nouvelle app, pour incarner nos valeurs entre collègues\n\n",UIImage(named: "\(theChatToShare.chatValue.subjectImage)")!,URL(string: "https://simplon.co/formation/foundation/24")!])
            }
    }
}

struct OpenModalDiscussLive: View {
    var theChatToShare : Chat
    // Quand cette variable est true la modal est présente
    @State private var modalPresent = false
    var body: some View {
        Button {
            modalPresent.toggle()
        } label: {
            Label("Rejoindre", systemImage:"quote.bubble.rtl")
        }.sheet(isPresented: $modalPresent) {
            // Vue affichée par la modal
            DiscussDetailView(theChatToDisplay: theChatToShare)
        }.buttonStyle(.bordered)
            .tint(Color(red: theChatToShare.chatValue.subjectColorRed, green: theChatToShare.chatValue.subjectColorGreen, blue: theChatToShare.chatValue.subjectColorBlue)).foregroundColor(.black)
            .buttonBorderShape(.roundedRectangle)
            .font(.footnote)
    }
}

struct AddDiscuss : View {
    var grid = [GridItem(.adaptive(minimum: 90), spacing: -10)]
    var body: some View {
        VStack(alignment: .center){
            NavigationView{
                LazyVGrid(columns: grid, spacing: 3){
                    ForEach(tableauDeValeurs){val in
                        NavigationLink{
                            DiscussDetailView(theChatToDisplay: Chat(chatValue: val, tabUsers: [sarah]))
                        }label: {
                            CelluleValeurToDiscuss(subjectValue: val)
                        }
                        
                    }
                }.navigationTitle("Discutons !")
            }.padding()
        }
    }
}

struct OpenModal_Previews: PreviewProvider {
    static var previews: some View {
        AddDiscuss()
        //OpenModal(btnLabelDasagn: "\(Image(systemName: "arrowshape.turn.up.forward").foregroundColor(.secondary).offset(x:-5, y:-75))")
    }
}

