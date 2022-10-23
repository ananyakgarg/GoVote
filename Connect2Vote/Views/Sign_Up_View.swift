//
//  Sign-Up-View.swift
//  Connect2Vote
//
//  Created by Ananya Garg on 10/22/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


struct Sign_Up_View: View {
    @State var signUpProcessing = false
    @State var firstname = ""
    @State var lastname = ""
    @State var phone = ""
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var passwordConfirm = ""
    
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        SignUpFields(firstname: $firstname, lastname: $lastname, phone: $phone, username: $username, email: $email, password: $password, passwordConfirmation: $passwordConfirm)
    }

    func signUpUser(userEmail: String, userPassword: String){
        signUpProcessing = true
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) {authResult,
            error in
            guard error == nil else{
                signUpProcessing = false
                return
            }
                switch authResult{
                case .none:
                    print("Could not create account.")
                    signUpProcessing = false
                case .some(_):
                    print("User created")
                    signUpProcessing = false
                    guard let UserID = Auth.auth().currentUser?.uid else{
                        return
                    }
                    let db = Firestore.firestore()
                    let userDocRef = db.collection("users")
                    userDocRef.document(UserID).setData([
                        "name": firstname,
                        "lastname": lastname,
                        "phoneNumber": phone,
                        "username": username,
                        "email": email,
                        "password": password,
                        "id": UserID
                    ])
                    viewRouter.currentPage = .rideSchedulePage
                
                
            }
        
        }
    }




}




struct SignUpFields: View{
    
    @Binding var firstname: String
    @Binding var lastname: String
    @Binding var phone: String
    @Binding var username: String
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordConfirmation: String
    
        
    var body: some View{
        Group{
            TextField("First Name", text: $firstname)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
            TextField("Last Name", text: $lastname)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
            TextField("Phone Number", text:$phone)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
            TextField("Create Username", text: $username)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
            SecureField("Re-enter password", text: $passwordConfirmation)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
        }
    }
    
}













struct Sign_Up_View_Previews: PreviewProvider {
    static var previews: some View {
        Sign_Up_View().environmentObject(ViewRouter())
    }
}


