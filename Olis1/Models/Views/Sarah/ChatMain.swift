import SwiftUI


struct ChatView : View {
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    ChatHeaderView()
                    Section(""){
                        ChatBodyView().mask(LinearGradient(stops:[Gradient.Stop(color: .clear, location: 0), Gradient.Stop(color: .white, location: 0.1),], startPoint: .bottom, endPoint: .top))
                    }.textSelection(.disabled)
                    HStack{
                        Spacer()
                        ChatFooterView().padding(.bottom)
                        Spacer()
                    }
                }
            }.navigationTitle("Chat").navigationViewStyle(.stack)
        }
    }
}

struct ChatHeaderView : View {
    var discussLive = tabChatBlabla
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(discussLive){chat in CelluleValeur(subjectValue: chat.chatValue)}
                }.padding(.horizontal)
            }
        }
    }
}

struct ChatFooterView : View {
    @State private var modalPresent = false
    var body: some View {
        Button {
            modalPresent.toggle()
        } label: {
            Label("Discuter", systemImage:"plus.message.fill")
        }.sheet(isPresented: $modalPresent) {
            // Vue affichée par la modal
            AddDiscuss()
        }.buttonStyle(.borderedProminent).tint(.black)
            .buttonBorderShape(.roundedRectangle)
    }
}


struct ChatBodyView : View {
    @State var currentChats = tabChatBlabla
    var body: some View {
        ScrollView{
            if(currentChats.isEmpty){
                VStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: .infinity, height: 100, alignment: .center)
                        .padding(.bottom)
                        .foregroundColor(Color(red : 207/255, green : 203/255, blue : 203/255))
                        .overlay(Text("Engagez la discussion \(Image(systemName: "message.and.waveform.fill"))").foregroundColor(.secondary).offset(x:0, y:-5))
                }
            }else{
                ForEach(currentChats){ chat in CelluleDiscuss(discuss: chat)}
                //.edgesIgnoringSafeArea(.horizontal)
            }
        }
    }
}




struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
