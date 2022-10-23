//
//  ViewRouter.swift
//  Connect2Vote
//
//  Created by Ananya Garg on 10/22/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth


class ViewRouter: ObservableObject{
    @Published var currentPage: Page = .signUpPage
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var phone = ""
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    @Published var user_name = ""
    
    private var db = Firestore.firestore()
    
    
    
}
    
    
    




enum Page{
    case signUpPage
    case rideSchedulePage
}
