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
    
    
    
}



enum Page{
    case signUpPage
}
