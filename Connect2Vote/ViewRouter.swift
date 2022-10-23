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
    // Onboarding details for each rider
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var phone = ""
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    @Published var user_name = ""

    // Variables for Rides
    @Published var ride_date: Date = Date()
    @Published var ride_startLoc: String = ""
    @Published var ride_endLoc: String = ""
    @Published var ride_completed: Bool = false
    
    // List to hold radiobuttonfields
    @Published var orgsLst = [Org(id: "", name: "")]
    
    private var db = Firestore.firestore()
    
    
    // Creates a new ride instance
    func createRide(ride_date: Date, ride_startLoc: String, ride_endLoc: String, ride_completed: String) {
        let db = Firestore.firestore()
        
        // Change:
        /// change this to not be hard coded into one user
        let newRide = db.collection("riders").document("jenny_smith").collection("rides").document()
        
        newRide.setData(["id": newRide.documentID, "date" : ride_date, "startLocation" : ride_startLoc, "endLocation": ride_endLoc, "completedStatus": false]) { error in
        }

    }
    
    
    
    func populateOrgs(){
        db.collection("organizations").getDocuments(){ [self]
            (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        self.orgsLst.append(Org(id: document.documentID, name: document["name"] as! String))
                    }
                }
            }

    
}
    
    
    
}


    
struct Org: Identifiable{
var id: String
var name: String
}
    
    




enum Page{
    case signUpPage
    case rideSchedulePage
    case orgChoiceView
}
