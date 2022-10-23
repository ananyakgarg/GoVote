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
    @Published var orgsLst = [Org]()
     
//    private var db = Firestore.firestore()
    
    
    // Creates a new ride instance
    func createRide(ride_date: Date, ride_endLoc: String, ride_completed: Bool) {
        let db = Firestore.firestore()
        guard let currentUserID = Auth.auth().currentUser?.uid else{
            return
        }
        let currUserRef = db.collection("riders").document(currentUserID)

        
        
        // Change:
        /// change this to not be hard coded into one user
        let newRide = currUserRef.collection("rides").document()
        
        newRide.setData(["id": newRide.documentID, "date" : ride_date, "startLocation" : ride_startLoc, "endLocation": ride_endLoc, "completedStatus": false]) { error in
        }

    }
    
    
    
    func populateOrgs(){
        let db = Firestore.firestore()
        db.collection("organizations").getDocuments { (snapshot, err) in
            if err == nil{
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.orgsLst = snapshot.documents.map { d in
                            return Org(id: d.documentID,
                                       org_name: d["name"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
}


    
struct Org : Identifiable{
    var id: String
    var org_name: String
}
    
    




enum Page{
    case signUpPage
    case rideSchedulePage
    case orgChoiceView
    case confirmationView
    case logInView
}
