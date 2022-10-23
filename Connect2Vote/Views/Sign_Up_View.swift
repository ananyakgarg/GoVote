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
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var signUpProcessing = false
    @State var firstname = ""
    @State var lastname = ""
    @State var phone = ""
    @State var email = ""
    @State var password = ""
    @State var passwordConfirm = ""
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()

            VStack{
                            
                HStack{
                    // Button to create account
                    Spacer()
                        Text("Create Account")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .semibold))
                            Spacer()
                        
                            }
                Spacer()
                // Assigns the user's input with the various sign up fields
                SignUpFields(firstname: $firstname, lastname: $lastname, phone: $phone, email: $email, password: $password, passwordConfirmation: $passwordConfirm)
                
                Spacer()
                Button(action: {
                    // Calls function to sign a user in
                    signUpUser(userEmail: email, userPassword: password)
                    }, label:{
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 360, height: 70)
                            .background(Color.black)
                            .cornerRadius(15)
                    })
                // Ensures user fields are valid prior to sign in
                .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !passwordConfirm.isEmpty && password == passwordConfirm ? false: true)
            }
           
        }
        
    }
    
    struct Sign_Up_View_Previews: PreviewProvider {
        static var previews: some View {
            Sign_Up_View().environmentObject(ViewRouter())
        }
    }
    
    // Function to sign user up, uses password and email for unique identification
    func signUpUser(userEmail: String, userPassword: String){
        print("testing ")
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
                    let userDocRef = db.collection("riders")
                    // Creates new document in the rider's database, sets the data of the riders
                    userDocRef.document(UserID).setData([
                        "name": firstname,
                        "lastname": lastname,
                        "phoneNumber": phone,
                        "email": email,
                        "password": password,
                        "id": UserID
                    ])
                    viewRouter.currentPage = .rideSchedulePage
                
            }
        
        }
    }




}



// Struct for various sign up fields
struct SignUpFields: View{
    
    @Binding var firstname: String
    @Binding var lastname: String
    @Binding var phone: String
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
















