

import SwiftUI
import MapKit
import Firebase
import FirebaseFirestore
import FirebaseCore
import GoogleSignIn

struct SignInView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State  var username = ""
    @State private var password = ""
    @State var signInProcess = false
    @State var signInError = ""
    
    
    var body: some View {
        ZStack{
            Color(red: 0, green: 0, blue: 0)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Sign In")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold))
            
            HStack{
                Spacer()
                Spacer()
                Spacer()
                VStack{
                Spacer()
                signInFields(username: $username, password: $password)
                Button(action: {
                    userIn(myUsername: username, myPwd: password)
                    
                }){
                    Text("Log in with Google")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 360, height: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .disabled(!signInProcess && !username.isEmpty && !password.isEmpty ? false : true)
                Spacer()
                HStack{
                    Button(action: {
                        viewRouter.currentPage = .signUpPage
                    }){
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                        
                        
                    }
                }
                    Spacer()
                    Spacer()
                
                
                }
                Spacer()
                Spacer()
                Spacer()
            }
            }
        }
        
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environmentObject(ViewRouter())
    }
}
    
    func userIn(myUsername: String, myPwd: String){
        signInProcess = true
        Auth.auth().signIn(withEmail: username, password: password){
            authResult, error in
            guard error == nil else{
                signInProcess = false
                signInError = error!.localizedDescription
                return
            }
            switch authResult{
            case .none:
                print("We couldn't sign you in, try again.")
            case .some(_):
                print("Welcome to the party!")
                signInProcess = false
//                viewRouter.currentPage = .requestPage
            }
        }
    }
}

            
struct signInFields: View{
    @Binding var username: String
    @Binding var password: String
    
    var body: some View{
        Group{
            TextField("Username", text: $username)
                .padding()
                .font(.system(size:25, weight: .bold))
                .background(Color.white)
                .cornerRadius(10.0)
            // format this however
            SecureField("Password", text: $password)
                .padding()
                .font(.system(size:25, weight: .bold))
                .background(Color.white)
                .cornerRadius(10.0)
            // format this however
        }
    }
}
