import SwiftUI

struct SwiftUIView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Color.orange
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                    autheticateurUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("Bonjour, ravi de vous revoir  @\(username)"), isActive: $showingLoginScreen) {
                        
                        EmptyView()
                        
                    }
                    
                    
                }
                
                
                
                
                
                
            }
            .navigationBarHidden(true)
            
        }

    }
    
    func autheticateurUser(username: String, password: String){
        
        if username.lowercased() == "prune" {
            wrongUsername = 0
            if password.lowercased() == "olis" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
    
    
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
