import SwiftUI

struct UserSpeaking : View {
    var user : User
    var body: some View {
        Group {
            if(user.isTalking == true){
                VStack(alignment: .center){
                    Image(user.userPicture)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 52, height: 50, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 21))
                        .overlay(Circle()
                            .strokeBorder(lineWidth: 2).foregroundColor(Color(red : 246/255, green : 245/255, blue : 245/255))
                            .frame(width: 14, height: 14, alignment: .center)
                            .background(.green).clipShape(Circle()).offset(x: 20, y:19))
                    if(user.isOrganizer == true){
                        Text("✳️\(user.userName)").font(.caption).bold().offset(x:0, y:0)
                    }else{
                        Text(user.userName).font(.caption).bold().offset(x:0, y:0)
                    }
                }
            }else{
                VStack(alignment: .center){
                    Image(user.userPicture)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 52, height: 50, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 21))
                        .overlay(Image(systemName: "ear.and.waveform")
                            .frame(width: 50, height: 20, alignment: .center)
                            .background(.bar).clipShape(Circle()).offset(x: 20, y:19))
                    Text("\(user.userName)").font(.caption).bold().offset(x:0, y:0)
                }
            }
        }
    }
}

struct BubbleStateSpeackerInHome : View {
    var user : User
    var body: some View {
        if(user.isTalking == true){
            UserSpeaking(user: user)
        }else {
            VStack(alignment: .center){
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: .infinity, height: 100, alignment: .center)
                    .padding(.bottom)
                    .foregroundColor(Color(red : 207/255, green : 203/255, blue : 203/255))
                    .padding()
                    .overlay(Text("Engagez la discussion \(Image(systemName: "message.and.waveform.fill"))").foregroundColor(.secondary).offset(x:0, y:-5))
            }
        }
    }
}
struct BubbleStateInHome_Previews: PreviewProvider {
    static var previews: some View {
        List(userList){user in BubbleStateSpeackerInHome(user: user)}
    }
}
